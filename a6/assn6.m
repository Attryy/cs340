load('arrowhead.mat')
G = adjacency(X,names);
RandomWalk(G,0.1,1000000);
r = ans;
table = tabulate (r);
table(:,3)= table(:,3)/sum(table(:,3));
median(table(:,3))


