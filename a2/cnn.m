function [cnnmodel] = cnn(X,y,k)
% [cnnmodel] = cnn(X,y,k)

% Implementation of condensed k-nearest neighbour classifer

cnnmodel.X = X;
cnnmodel.y = y;
cnnmodel.k = k;
cnnmodel.c = max(y);
[n,d] = size(cnnmodel.X);
cnnmodel.subsetx =cnnmodel.X(1,:);
cnnmodel.subsety =cnnmodel.y(1,:);
for t=2:n
model = knn(cnnmodel.subsetx,cnnmodel.subsety,cnnmodel.k);
yhat=  model.predict(model,cnnmodel.X(t,:));
if yhat~=cnnmodel.y(t,:)
cnnmodel.subsetx(end+1,:)=cnnmodel.X(t,:);
cnnmodel.subsety(end+1,:)=cnnmodel.y(t,:);
end 
end 
cnnmodel.predict = @predict;
end

function [yhat] = predict(cnnmodel,Xtest)
[n,d]=size(cnnmodel.subsetx);
[t,d]=size(Xtest);
D = cnnmodel.subsetx.^2*ones(d,t) + ones(n,d)*(Xtest').^2 - 2*cnnmodel.subsetx*Xtest';
[~,ncol]=sort(D);
if cnnmodel.k==1
    yhat=cnnmodel.subsety(ncol(1:cnnmodel.k,:));
else
    yhat=mode(cnnmodel.subsety(ncol(1:cnnmodel.k,:)),1);
end 
end


