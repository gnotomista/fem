function f=forzetrave(l,q)
gp=GAUSS(2);
D1=operatorespostamento(l,gp.x(1)*l/2);
D2=operatorespostamento(l,gp.x(2)*l/2);
f=(l/2*q'*(D1+D2))';
% q è un vettore colonna
% f è un vettore colonna
end