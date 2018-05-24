function Ms=massasezione(P,rho)
A=area(P);
S=statico(P);
J=inerzia(P);
Ms=[A 0 0 0 0 -S(2);
    0 A 0 0 0 S(1);
    0 0 A S(2) -S(1) 0;
    0 0 S(2) J(2,2) J(1,2) 0;
    0 0 -S(1) J(1,2) J(1,1) 0;
    -S(2) S(1) 0 0 0 J(1,1)+J(2,2)]*rho;
end