function [row, col] = block_selection(A,key)

E = zeros(128,128);
for i = 1:128
    for j = 1:128
        a = A((4*i-3):4*i, (4*j-3):4*j);
        if (sum(sum(a == 0)) >= 9)
            E(i,j) = 10^6;
        else
            E(i,j) = entropy(a);
        end
    end
end

D = (sort(E(:),'ascend'));
thre = D(length(key));

[row, col] = find(E<=thre);

end
