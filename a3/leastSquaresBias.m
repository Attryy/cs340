function [model] = leastSquaresBias(X,y)

Z = [ones(size(X,1),1) X];
% Solve least squares problem
w = (Z'*Z)\Z'*y;

model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat)
w = model.w;
Zhat= [ones(size(Xhat,1),1) Xhat];
yhat = Zhat*w;
end