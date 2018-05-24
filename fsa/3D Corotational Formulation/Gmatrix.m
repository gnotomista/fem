function G=Gmatrix(node,element)


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

[q1,q2,q]=qvector(Rg1,Rg2,R0);

Rr=Rrmatrix(node,element);

c=Rr'*q;
c1=Rr'*q1;
c2=Rr'*q2;

n=c(1)/c(2);
n11=c1(1)/c(2);
n12=c1(2)/c(2);
n21=c2(1)/c(2);
n22=c2(2)/c(2);

ln=norm(xyzf+uf-xyzi-ui);

G=zeros(12,3);

G(3,1)=n/ln;
G(4,1)=n12/2;
G(5,1)=-n11/2;
G(9,1)=-n/ln;
G(10,1)=n22/2;
G(11,1)=-n21/2;
G(3,2)=1/ln;
G(9,2)=-1/ln;
G(2,3)=-1/ln;
G(8,3)=1/ln;


end