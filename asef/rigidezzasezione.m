function Ks=rigidezzasezione(E,G,P)
A=area(P);
S1=statico(P)'*[1;0];
S2=statico(P)'*[0;1];
J11=(inerzia(P)*[1;0])'*[1;0];
J12=(inerzia(P)*[1;0])'*[0;1];
J21=(inerzia(P)*[0;1])'*[1;0];
J22=(inerzia(P)*[0;1])'*[0;1];
Jp=J11+J22;
Ks=[E*A, E*S1, E*S2, 0;
    E*S1, E*J11, E*J12, 0;
    E*S2, E*J21, E*J22, 0;
    0, 0, 0, G*Jp];
end