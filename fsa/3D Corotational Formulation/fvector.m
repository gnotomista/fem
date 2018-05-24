function fl=fvector(node,element)


ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

di=node(ni).displacements;
df=node(nf).displacements;

d=[di;df];

B=Bmatrix(node,element);

dl=B*d;

ui=di(1:3);
uf=df(1:3);

ln=norm(xyzf+uf-xyzi-ui);

B1=strainoperator(ln,-ln/(2*sqrt(3)));
B2=strainoperator(ln,ln/(2*sqrt(3)));

rbm=[7,4,5,6,10,11,12];

e1=B1(:,rbm)*dl;
e2=B2(:,rbm)*dl;

[~,s1]=fiberfree(element,e1);
[~,s2]=fiberfree(element,e2);

fl=ln/2*((B1(:,rbm))'*s1+(B2(:,rbm))'*s2);


end