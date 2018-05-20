function[r]=RandomWalk(G,alpha,k)
%start with some random node
%k is the number of iterations
%G is an undirected graph 
[n,~] = size(G);
startpos = randsample(n,1);
current = startpos;
list = current;
for i = 1:k
    test = rand;
    if(test<= alpha)
     pos = randsample(n,1) ;
    else 
        neighbour = find(G(current,:));
        pos = datasample(neighbour,1);
    end
    current=pos;
    list(size(list,2)+1)= current;
end
r = list;
end

        
    