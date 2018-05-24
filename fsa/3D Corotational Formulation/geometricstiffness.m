function GSM=geometricstiffness(node,element)


f=fvector(node,element);
D=Dmatrix(node,element);
E=Ematrix(node,element);
Q=Qmatrix(node,element);
G=Gmatrix(node,element);
a=avector(node,element,f);
r=rvector(node,element);

GSM=D*f(1)-E*Q*G'*E'+E*G*a*r;


end