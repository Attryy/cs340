function [model] = knn(X,y,k)
% [model] = knn(X,y,k)
%
% Implementation of k-nearest neighbour classifer

model.X = X;
model.y = y;
model.k = k;
model.c = max(y);
model.predict = @predict;
end

function [yhat] = predict(model,Xtest)
[n,d]=size(model.X);
[t,d]=size(Xtest);
D = model.X.^2*ones(d,t) + ones(n,d)*(Xtest').^2 - 2*model.X*Xtest';
[~,ncol]=sort(D);
if model.k==1
    yhat=model.y(ncol(1:model.k,:));
else
    yhat=mode(model.y(ncol(1:model.k,:)),1);
end 
end
