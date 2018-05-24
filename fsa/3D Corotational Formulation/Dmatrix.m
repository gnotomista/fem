function D=Dmatrix(node,element)


Rr=Rrmatrix(node,element);
r1=Rr(:,1);

o=zeros(3);

I=eye(3);

ni=element.connections(1);
nf=element.connections(2);

xyzi=node(ni).xyz;
xyzf=node(nf).xyz;

di=node(ni).displacements;
df=node(nf).displacements;

ui=di(1:3);
uf=df(1:3);

ln=norm(xyzf+uf-xyzi-ui);

D3=(I-r1*r1')/ln;

D=[D3 o -D3 o;
   o o o o;
   -D3 o D3 o;
   o o o o];


end