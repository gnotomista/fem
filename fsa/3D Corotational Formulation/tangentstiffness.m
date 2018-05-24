function Kl=tangentstiffness(node,element)


ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

di=node(ni).displacements;
df=node(nf).displacements;

d=[di;df];

ui=di(1:3);
uf=df(1:3);

ln=norm(xyzf+uf-xyzi-ui);

B1=strainoperator(ln,-ln/(2*sqrt(3)));
B2=strainoperator(ln,ln/(2*sqrt(3)));

e1=B1*d;
e2=B2*d;

[Ks1,~]=fiberfree(element,e1);
[Ks2,~]=fiberfree(element,e2);

Ke=ln/2*(B1'*Ks1*B1+B2'*Ks2*B2);

Kl=Ke([7,4,5,6,10,11,12],[7,4,5,6,10,11,12]);


end