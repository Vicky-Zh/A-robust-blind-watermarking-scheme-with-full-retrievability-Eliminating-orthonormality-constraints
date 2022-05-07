function [A1, PSNR, row, col, key, Ku, Kus] = ESVD(Host, Watermark, theta)
% Read the host image
A = imread(Host);
A = A(:,:,1);
% Read the watermark image
B = imread(Watermark);
B = imresize(B,1/8);
% Transform watermark image to a binary sequence
key = '';
for i = 1:size(B,1)
    for j = 1:size(B,2)
        key = [key , dec2bin(B(i,j),8)];
    end
end
% Block Selection
[row, col] = block_selection(A,key);
% Watermark Embedding
A = double(A);
A1 = A;
for k = 1:length(key)
    
       w = str2num(key(k));
       
       i = row(k); j = col(k);
       a = A((4*i-3):4*i, (4*j-3):4*j);
       a(a==0) = a(a==0)+10^(-6);
       [U, s, v] = svd(a);
       [u, itr, flag] = Givens_transformation(U);
       Ku((4*i-3):4*i, (4*j-3):4*j) = u;
       
       if (w == 1)
           u(2:4,1) = u(2:4,1) + theta;
           u(3:4,2) = u(3:4,2) + theta;
           u(4,3) = u(4,3) + theta;
       else
           u(2:4,1) = u(2:4,1) - theta;
           u(3:4,2) = u(3:4,2) - theta;
           u(4,3) = u(4,3) - theta;
       end
       U_w = Reverse_transformation(u, itr, flag);
       Kus(i,(4*j-3):4*j) = U_w(1,1:4)>0;
       A1((4*i-3):4*i, (4*j-3):4*j) = U_w * s * v';
           
end
Kus = round(Kus);
Kus(Kus==0) = -1;
A1(isnan(A1)) = 0;

%PSNR
[m,n]=size(A);
MES=sum(sum((A-A1).^2))/(m*n); 
PSNR=10*log10(255^2/MES);

end
