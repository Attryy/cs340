cd('C:\Users\yiwei\Documents\UBC\cpsc 340\a1')
load fluTrends.mat
%Question 1 
%The minimum, maximum, mean, median, and mode of all values across the dataset.
max(X(:))
min(X(:))
mean2(X)
%Convert matrix X into a vector X1
X1=reshape(X,1,520) ;
median(X1)
mode(X1)

%The 10%, 25%, 50%, 75%, and 90% quantiles across the dataset.
quantile(X1,[0.1,0.25,0.5,0.75,0.9])


%The regions with the highest and lowest means, and the highest and lowest variances.
colmeans=mean(X,1);
names(find(colmeans==max(colmeans)))
names(find(colmeans==min(colmeans)))
colvar=var(X,1);
names(find(colvar==max(colvar)))
names(find(colvar==min(colvar)))

%The pairs of regions with the highest and lowest correlations.
n=size(X,1);
d=size(X,2);
corr=zeros(nchoosek(10,2),3);
for k=1:(d-1)
    for j=(k+1):d
        corrmatrix=corrcoef(X(:,k),X(:,j));
        K=0:1:(k-1);
        corr((k-1)*d-sum(K)+j-k,1)=corrmatrix(1,2);
        corr((k-1)*d-sum(K)+j-k,2)=k;
        corr((k-1)*d-sum(K)+j-k,3)=j;
        
    end
end
max(corr(:,1))
find(corr(:,1)==max(corr(:,1)))
names(corr(10,[2,3]))
min(corr(:,1))
find(corr(:,1)==min(corr(:,1)))
names(corr(7,[2,3]))

%A plot containing the weeks on the x-axis and the percentages for each region on the y-axis.
plot(X)
title('Plot for Weeks vs Percentages of each region')
xlabel('Weeks')
ylabel('Percentage')
legend('show')
legend(names)

%A boxplot grouping data by weeks, showing the distribution across regions for each week.
boxplot(transpose(X))
title('Boxplot for Percentages of each region')
xlabel('Regions')
ylabel('Percentage')

%A histogram showing the distribution of all the values in the matrix X.
hist(X1)
title('Histogram for Percentages of all regions')
xlabel('Percentage')
ylabel('Frequency')

%A single histogram showing the distribution of all the columns in X.
hist(X)
title('Histogram for Percentages of each region')
xlabel('Percentage')
ylabel('Frequency')
legend('show')
legend(names)

%A scatterplot between the two regions with lowest correlation.
scatter(X(:,1),X(:,8),'filled')
title('Scatterplot between two regions with lowest correlation')
xlabel('NE')
ylabel('Mtn')

%A scatterplot between the two regions with highest correlation.
scatter(X(:,2),X(:,3),'filled')
title('Scatterplot between two regions with highest correlation')
xlabel('MidAtl')
ylabel('ENCentral')






