function [Rg1,Rg2]=Rgmatrix(node,element)


ni=element.connections(1);
nf=element.connections(2);

di=node(ni).displacements;
df=node(nf).displacements;

ri=di(4:6);
rf=df(4:6);

rg1=skewsymm(ri);
rg2=skewsymm(rf);

Rg1=expm(rg1);
Rg2=expm(rg2);


end