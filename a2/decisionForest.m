function [model] = decisionForest(X,y,depth,nBootstraps)
[n,d] = size(X);
% Fit model to each boostrap sample of data
for m = 1:nBootstraps
    %each tree is trained on a different boostrap sample
    %pos=randsample(n,n,true); %sample size n with replacement
    %model.subModel{m} = decisionTree(X(pos,:),y(pos,:),depth);
    %model.subModel{m} = decisionTree(X,y,depth);
    % model.subModel{m} = randomTree(X(pos,:),y(pos,:),depth);
     model.subModel{m} = randomTree(X,y,depth);
end

model.predict = @predict;

end

function [y] = predict(model,X)

% Predict using each model
for m = 1:length(model.subModel)
    y(:,m) = model.subModel{m}.predict(model.subModel{m},X);
end

% Take the most common label
y = mode(y,2);
end