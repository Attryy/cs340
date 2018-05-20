function [model] = leastSquaresBiasNew(x,y,p)

basis = polyBasis(x,p);
Z = basis.Z;
% Solve least squares problem
w = (Z'*Z)\Z'*y;

model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat,p)
w = model.w;
basis= polyBasis(Xhat,p);
Zhat=basis.Z;
yhat = Zhat*w;
end