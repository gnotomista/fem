function Q=Qmatrix(node,element)


f=fvector(node,element);

P=Pmatrix(node,element);

nm=P'*f(2:7);

n1=nm(1:3);
m1=nm(4:6);
n2=nm(7:9);
m2=nm(10:12);

N1=skewsymm(n1);
M1=skewsymm(m1);
N2=skewsymm(n2);
M2=skewsymm(m2);

Q=[N1;M1;N2;M2];


end