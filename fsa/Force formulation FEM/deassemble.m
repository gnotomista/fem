function [Ddi,L,R,T,ni,nf]=deassemble(node,element,Dd)


ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

L=norm(xyzf-xyzi);

R=rotationmatrix(xyzi,xyzf,element.reference);

Ddg(1:6)=Dd(6*ni-5:6*ni);
Ddg(7:12)=Dd(6*nf-5:6*nf);

Ddl=R*Ddg';

T=RBMmatrix(L);

Ddi=T*Ddl;


end