function Ke=rigidezzaelemento(l,E,G,P)
Ks=rigidezzasezione(E,G,P);
gp=GAUSS(2);
B1=operatoredeformazione(l,gp.x(1)*l/2);
B2=operatoredeformazione(l,gp.x(2)*l/2);
Ke=l/2*(B1'*Ks*B1+B2'*Ks*B2);
end