load animals.mat

[n,d] = size(X);
X = standardizeCols(X);
model = dimRedPCA(X,2);
Z = model.compress(model,X);
W = model.W;

figure(1);
plot(Z(:,1),Z(:,2),'.');
gname(animals);


denom = sqrt(sum(sum(X.*X)));
T = Z*W-X;
nom = sqrt((sum(sum(T.*T))));
1-nom/denom