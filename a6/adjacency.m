function[G]= adjacency(data,label)
[n,~] = size(label);
G = zeros(n,n);
[k,~] = size(data);
for i =1:k
    pos =data(i,:);
    G(pos(1,1),pos(1,2))=1;
     G(pos(1,2),pos(1,1))=1;
end 
end


