function Ks=sectionstiffness0(E,G,P)


A=area(P);

S=Iareamoment(P);

J=IIareamoment(P);

Ks=[E*A, E*S(1), E*S(2), 0;
    E*S(1), E*J(1,1), E*J(1,2), 0;
    E*S(2), E*J(2,1), E*J(2,2), 0;
    0, 0, 0, G*(J(1,1)+J(2,2))];


end