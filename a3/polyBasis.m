function [basis] = polyBasis(x,p)
[n,~]=size(x);
Z = zeros(n,(p+1));
for i=1:n
    for j=1:(p+1)
        Z(i,j)= x(i,1)^(j-1);
    end
end
basis.Z = Z;
end
