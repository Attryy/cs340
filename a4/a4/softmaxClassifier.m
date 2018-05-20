function [model] = softmaxClassifier(X,y)
% Classification using one-vs-all least squares

% Compute sizes
[~,d] = size(X);
k=max(y);

maxFunEvals = 400; % Maximum number of evaluations of objective
verbose = 1; % Whether or not to display progress of algorithm
w0 = zeros(d*k,1);
model.w = findMin(@softmaxLoss,w0,maxFunEvals,verbose,X,y);
model.predict = @predict;
model.k=k;
model.d=d;
end

function [yhat] = predict(model,X)
w = model.w;
k = model.k;
d = model.d;
W =reshape(w,d,k);
[~,yhat] = max(X*W,[],2);
end

function [f,g] = softmaxLoss(w,X,y) 
k = max(y);
[~,d]=size(X);
W=reshape(w,d,k); %reshape by column
value=exp(X*W);
f = sum(diag(-X*W(:,y)))+sum(log(sum(value,2))); % Function value
g = zeros(d,k); % Gradient
for i = 1: d
    for j = 1:k
        denom = sum(value,2);
        num = exp(X*W(:,j));
        g(i,j)= -sum(X(:,i)'*(y==j))+sum(X(:,i).*num./denom);
    end
end  
g = reshape(g,d*k,1);
end