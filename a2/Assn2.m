cd('C:\Users\yiwei\Documents\UBC\cpsc 340\a2')
load citiesSmall.mat
[n,d] = size(X);
k =1 ;
model = knn(X,y,k);
classifier2Dplot(X,y,Xtest, ytest, model)

% Evaluate training error
yhat = model.predict(model,X);
errorTrain = sum(yhat ~= y)/n;


% Evaluate test error
t = size(Xtest,1);
yhat = model.predict(model,Xtest);
errorTest = sum(yhat ~= ytest)/t;

%use a new data set called 'citiesBig1'
load citiesBig1.mat
[n,d] = size(X);
k =1 ;
cnnmodel = cnn(X,y,k);
classifier2Dplot(X,y,Xtest, ytest, cnnmodel)

% Evaluate training error
yhat = cnnmodel.predict(cnnmodel,X);
errorTrain = sum(yhat ~= y)/n;
classifier2Dplot(X,y,Xtest, ytest, cnnmodel)

% Evaluate test error
t = size(Xtest,1);
yhat = cnnmodel.predict(cnnmodel,Xtest);
errorTest = sum(yhat ~= ytest)/t;

load citiesBig2.mat
[n,~] = size(X);
k =1 ;
cnnmodel = cnn(X,y,k);

% Evaluate training error
yhat = cnnmodel.predict(cnnmodel,X);
errorTrain = sum(yhat ~= y)/n;


% Evaluate test error
t = size(Xtest,1);
yhat = cnnmodel.predict(cnnmodel,Xtest);
errorTest = sum(yhat ~= ytest)/t;

%question 2
load vowel.mat
[n,d] = size(X);
[t,d] = size(Xtest);
for i=1:15
    k=i;

    model=decisionTree(X,y,k);
    yhat1 = model.predict(model,X);
    errorTrain(i) = sum(yhat1 ~= y)/n;
    yhat2 =model.predict(model,Xtest);
    errorTest(i)=sum(yhat2~=ytest)/t;
end
plot(errorTrain); hold on 
plot(errorTest);
title('Plot of training error and test error')
xlabel('Depth')
ylabel('Error')
legend('show')
legend('TrainError','TestError')


%New training function called randomStump
[n,d] = size(X);
[t,d] = size(Xtest);
for i=1:15
    k=i;

    model=decisionTree(X,y,k);
    yhat1 = model.predict(model,X);
    errorTrain(i) = sum(yhat1 ~= y)/n;
    yhat2 =model.predict(model,Xtest);
    errorTest(i)=sum(yhat2~=ytest)/t;
end
plot(errorTrain); hold on 
plot(errorTest);
title('Plot of training error and test error')
xlabel('Depth')
ylabel('Error')
legend('show')
legend('TrainError','TestError')


%Train on a bootstrap sample 
[n,d] = size(X);
[t,d] = size(Xtest);
for i=1:15
    k=i;
    pos=randsample(n,n,true); %sample size n
    model=decisionTree(X(pos,:),y(pos,:),k);
    yhat1 = model.predict(model,X);
    errorTrain(i) = sum(yhat1 ~= y)/n;
    yhat2 =model.predict(model,Xtest);
    errorTest(i)=sum(yhat2~=ytest)/t;
end
plot(errorTrain); hold on 
plot(errorTest);
title('Plot of training error and test error')
xlabel('Depth')
ylabel('Error')
legend('show')
legend('TrainError','TestError')

%random forest
[n,~] = size(X);
k =Inf ;
nbootstrap =50;
model = decisionForest(X,y,k,nbootstrap);

% Evaluate training error
yhat = model.predict(model,X);
errorTrain = sum(yhat ~= y)/n;


% Evaluate test error
t = size(Xtest,1);
yhat = model.predict(model,Xtest);
errorTest = sum(yhat ~= ytest)/t;


%question 3
%output the clustering obtained by running k-means 50 times (with k = 4) and 
% taking the one with the lowest error
k = 4;
doPlot=0;
model = clusterKmeans(X,k,doPlot);
e= model.error(model,X);
minmodel=model;
for i= 2:50
  model = clusterKmeans(X,k,doPlot);
  e(end+1) = model.error(model,X);
  if e(i)<e(i-1)
      minmodel=model;
  end
end
clustering2Dplot(X,minmodel.y,minmodel.W)

%A plot of the minimum error found across 50 random
%initializations, as you vary k from 1 to 10

 e=zeros(10,50);
for i=1:10
    k=i;
    doPlot=0;
    for j=1:50
    model = clusterKmeans(X,k,doPlot);
    e(i,j)=model.error(model,X);
    end
end
sorte=sort(e,2);
plot(sorte(:,1));
title('Plot of minimum error')
xlabel('Number of Clusters')
ylabel('Minimum Error')

%question 3.3
load clusterData2.mat

k = 4;
doPlot=0;
model = clusterKmeans(X,k,doPlot);
e= model.error(model,X);
minmodel=model;
for i= 2:50
  model = clusterKmeans(X,k,doPlot);
  e(end+1) = model.error(model,X);
  if e(i)<e(i-1)
      minmodel=model;
  end
end
clustering2Dplot(X,minmodel.y,minmodel.W)

 e=zeros(10,50);
for i=1:10
    k=i;
    doPlot=0;
    for j=1:50
    model = clusterKmeans(X,k,doPlot);
    e(i,j)=model.error(model,X);
    end
end
sorte=sort(e,2);
plot(sorte(:,1));
title('Plot of minimum error')
xlabel('Number of Clusters')
ylabel('Minimum Error')
    

% k-medians
e=zeros(10,50);
for i=1:10
    k=i;
    doPlot=0;
    for j=1:50
    model = clusterKmedians(X,k,doPlot);
    e(i,j)=model.error(model,X);
    end
end
sorte=sort(e,2);
plot(sorte(:,1));
title('Plot of minimum error')
xlabel('Number of Clusters')
ylabel('Minimum Error')

%   Question 4
Iquant= quantizeImage(I,1);
image(Iquant/255);


