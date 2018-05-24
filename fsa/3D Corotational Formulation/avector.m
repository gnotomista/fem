function a=avector(node,element,f)


a=zeros(3,1);

[Rg1,Rg2]=Rgmatrix(node,element);
R0=R0matrix(node,element);
[~,~,q]=qvector(Rg1,Rg2,R0);
Rr=Rrmatrix(node,element);
c=Rr'*q;
n=c(1)/c(2);

ni=element.connections(1);
nf=element.connections(2);
xyzi=node(ni).xyz;
xyzf=node(nf).xyz;
di=node(ni).displacements;
df=node(nf).displacements;
ui=di(1:3);
uf=df(1:3);
ln=norm(xyzf+uf-xyzi-ui);

a(1)=0;
a(2)=n/ln*(f(2)+f(5))-1/ln*(f(3)+f(6));
a(3)=1/ln*(f(4)+f(7));


end