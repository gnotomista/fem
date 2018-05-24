function Rr=Rrmatrix(node,element)


ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

di=node(ni).displacements;
df=node(nf).displacements;

ui=di(1:3);
uf=df(1:3);

[Rg1,Rg2]=Rgmatrix(node,element);

R0=R0matrix(node,element);

[~,~,q]=qvector(Rg1,Rg2,R0);

r1=(xyzf+uf-xyzi-ui)/norm(xyzf+uf-xyzi-ui);
r3=cross(r1,q)/norm(cross(r1,q));
r2=cross(r3,r1);

Rr=[r1,r2,r3];


end