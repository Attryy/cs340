% Load training {X,y} and testing {Xtest,ytest} variables
load citiesSmall.mat
[n,d] = size(X);

depth = 2;
model = decisionTreeInfoGain(X,y,depth);

% Evaluate training error
yhat = model.predict(model,X);
errorTrain = sum(yhat ~= y)/n;
fprintf('Training error with depth-%d decision tree: %.3f\n',depth,errorTrain);

% Evaluate test error
t = size(Xtest,1);
yhat = model.predict(model,Xtest);
errorTest = sum(yhat ~= ytest)/t;
fprintf('Test error with depth-%d decision tree: %.3f\n',depth,errorTest);
  
errorTrain1=zeros(15,1);
errorTest1=zeros(15,1);
for i=1:15
    depth=i;
    [n,d] = size(X(201:400,:));
    model= decisionTreeInfoGain(X(201:400,:),y(201:400,1),depth);
    yhat= model.predict(model,X(201:400,:));
  
    errorTrain1(depth,1) = sum(yhat ~= y(201:400,1))/n;
    %t = size(Xtest,1);
     t = 200;
    yhat = model.predict(model,X(1:200,:));
    
    errorTest1(depth,1) = sum(yhat ~= y(1:200,1))/t;
end
plot(errorTrain1);hold on
plot(errorTest1)


    