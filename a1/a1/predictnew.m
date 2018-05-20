function [ y ] = predictnew( model, X )
%New predict function given the fitted depth-2 decision tree
splitModel=model.splitModel;
j = splitModel.splitVariable;
value = splitModel.splitValue;


subModel1 = model.subModel1;
subModel0 = model.subModel0;

j1=subModel1.splitVariable;
value1<-subModel1.splitValue;
sat1= subModel1.splitSat;
not1= subModel1.splitNot;

j0=subModel0.splitVariable;
value0=subModel0.splitValue;
sat0= subModel0.splitSat;
not0= subModel0.splitNot;


[t,d]=size(X)

for i=1:t
    if X(i,j)> value
        if X(i,j1)>value1
            y(i,1)= sat1;
        else y(i,1)= not1;
        end
    else if X(i,j0)> value0
            y(i,1)=sat0;
        else y(i,1)=not0;
        end
    end
end

end

