function hilbert_cond=hilbert(n)

% conditionarea matricii Hilbert
for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);
    end
end

hilbert_cond = cond(H)