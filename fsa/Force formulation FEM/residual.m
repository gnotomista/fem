function r=residual(f,fi,v)


constr=find(v);

fi(constr)=zeros(length(constr),1);

r=f-fi;


end