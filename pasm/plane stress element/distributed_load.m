function f=distributed_load(X,q)

% q è formato solo da due componenti:
% 1. carico distribuito lungo u
% 2. carico distribuito lungo v
% nel riferimento LOCALE

x=transltoG(X);

N1=displacement_operator_m(1/sqrt(3),1/sqrt(3));
N2=displacement_operator_m(-1/sqrt(3),1/sqrt(3));
N3=displacement_operator_m(-1/sqrt(3),-1/sqrt(3));
N4=displacement_operator_m(1/sqrt(3),-1/sqrt(3));

J1=det(jacobian(x,1/sqrt(3),1/sqrt(3)));
J2=det(jacobian(x,-1/sqrt(3),1/sqrt(3)));
J3=det(jacobian(x,-1/sqrt(3),-1/sqrt(3)));
J4=det(jacobian(x,1/sqrt(3),-1/sqrt(3)));

f=q'*(N1*J1+N2*J2+N3*J3+N4*J4);

end