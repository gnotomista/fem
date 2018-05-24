function Me=massaelemento(l,P,rho)
Ms=massasezione(P,rho);
gp=GAUSS(4);
D1=operatorespostamento(l,gp.x(1)*l/2);
D2=operatorespostamento(l,gp.x(2)*l/2);
D3=operatorespostamento(l,gp.x(3)*l/2);
D4=operatorespostamento(l,gp.x(4)*l/2);
Me=l/2*((D1'*Ms*D1)*gp.w(1)+(D2'*Ms*D2)*gp.w(2)+(D3'*Ms*D3)*gp.w(3)+(D4'*Ms*D4)*gp.w(4));
end