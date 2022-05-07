function[key1, w] = ESVD_extract(A2, Ku, Kus, row, col)

delta_theta = zeros(size(A2,1), size(A2,2));
key1 = '';
for p = 1:32*32*8

        i = row(p); j = col(p);
        a = A2((4*i-3):4*i, (4*j-3):4*j);
        %if(sum(sum(a)) == 0 || any(isnan(a(:))))
            %key1 = [key1, '0'];
            %continue;
        %end
        a(a==0) = a(a==0)+10^(-6);
        [Ua, S, ~] = svd(a);
        si = Kus(i,(4*j-3):4*j);
        for k = 1:4
            z = Ua(1,k);
            if sign(z) ~= si(k)
                Ua(:,k) = -1 * Ua(:,k);
            end
        end
        [Ta_w, ~, ~] = Givens_transformation(Ua);
        Ta = Ku((4*i-3):4*i, (4*j-3):4*j);
        
        sig = Ta_w - Ta;
        delta_theta((4*i-3):4*i, (4*j-3):4*j) = sig;
        
        if S(2,2)~=0
            if sum(sum(sig>0)) > 3
                w = 1;
            elseif sum(sum(sig>0)) > 3
                w = 0;
            else
                if sig(4,1)>0
                    w = 1;
                else
                    w = 0;
                end
            end
        else
            if sum(sum(sig(:,1)>0)) >= 2
                w = 1;
            else
                w = 0;
            end
        end
        
         key1 = [key1, num2str(w)];           
end



w = zeros(32,32);
for i = 1:32
    for j = 1:32
        k = 32 * (i-1) + j;
        w(i,j) = bin2dec(key1((8*k-7):8*k));
    end
end

imshow(w/255);

end
