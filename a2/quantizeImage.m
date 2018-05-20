function [Iquant] = quantizeImage(I,b)
[n,d,t]=size(I);
I=reshape(I, n*d,t);
k = 2^b;
doPlot =0;
model= clusterKmeans(I,k,doPlot);
W=model.W;
y=model.y;
Iquant=W(y , : ) ;
Iquant=reshape(Iquant,[n,d,t]);
end



