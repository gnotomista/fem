function Ke=elementstiffness0(L,E,G,P)


Ks=sectionstiffness0(E,G,P);

S1=stressoperator(L,-L/(2*sqrt(3)));
S2=stressoperator(L,L/(2*sqrt(3)));

Ke=inv(L/2*(S1'*(Ks\S1)+S2'*(Ks\S2)));


end