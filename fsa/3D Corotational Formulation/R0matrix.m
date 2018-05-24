function R0=R0matrix(node,element)


ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

v=element.reference;

e01=(xyzf-xyzi)/norm(xyzf-xyzi);
e03=cross(e01,v)/norm(cross(e01,v));
e02=cross(e03,e01);

R0=[e01,e02,e03];


end