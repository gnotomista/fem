function [r,R]=residual(f,fi,v)


r=f-fi;

constr=find(v);

r(constr)=zeros(length(constr),1);

R=norm(r);


end