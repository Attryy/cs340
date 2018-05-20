function [medmodel] = clusterKmedians(X,k,doPlot)
% [model] = clusterKmedians(X,k,doPlot)
%
% K-medians clustering

[n,d] = size(X);
y = ones(n,1);

% Choose random points to initialize means
  W = zeros(k,d);


for k = 1:k
    i = ceil(rand*n);
    W(k,:) = X(i,:);
end

while 1
    y_old = y;
    
    % Draw visualization
    if doPlot && d == 2
        clustering2Dplot(X,y,W)
    end
    distance=zeros(n,k);
    % Compute L1 norm between each data point and each mean
    for j=1:k
        for i=1:n
            distance(i,j)=norm((X(i,:)-W(j,:)),1);
        end
    end
           
    % Assign each data point to closest mean
    [~,y] = min(distance,[],2);
    
    % Draw visualization
    if doPlot && d == 2
        clustering2Dplot(X,y,W)
    end
    
    % Compute mean of each cluster
    for k = 1:k
        W(k,:) = median(X(y==k,:));
    end
    
    changes = sum(y ~= y_old);
    fprintf('Running K-means, difference = %f\n',changes);
    
    % Stop if no point changed cluster
    if changes == 0
        break;
    end
end

medmodel.W = W;
medmodel.y = y;
medmodel.predict = @predict;
medmodel.error = @error;
end

function [y] = predict(medmodel,X)
[t,d] = size(X);
W = medmodel.W;
k = size(W,1);

% Compute Euclidean distance between each data point and each mean
 distance=zeros(n,k);
    % Compute L1 norm between each data point and each mean
   for j=1:k
         for i=1:n
            distance(i,j)=norm((X(i,:)-W(j,:)),1);
        end
    end

% Assign each data point to closest mean
[~,y] = min(distance,[],2);
end

function [e] = error(medmodel,X)
[t,d] = size(X);
W = medmodel.W;
k = size(W,1);

% Compute Euclidean distance between each data point and each mean
distance=zeros(t,k);
 % Compute L1 norm between each data point and each mean
    for j=1:k
        for i=1:t
            distance(i,j)=norm((X(i,:)-W(j,:)),1);
        end
    end
sortD = sort(distance',1);
e =sum(sortD(1,:));
end
