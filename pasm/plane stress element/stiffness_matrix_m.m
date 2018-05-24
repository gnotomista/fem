function k_m=stiffness_matrix_m(X,t,E,ni)

x=translrotatetolocal(X);

C_m=elasticity_matrix_m(E,ni);

r_Gauss=[1/sqrt(3) -1/sqrt(3)];
s_Gauss=[1/sqrt(3) -1/sqrt(3)];

w_Gauss=[1 1];

k_m=zeros(8);

for i=1:length(w_Gauss)
    
    for j=1:length(w_Gauss)
        
        J=jacobian(x,r_Gauss(i),s_Gauss(j));
        
        B_m=strain_operator_m(x,r_Gauss(i),s_Gauss(j));
        
        k_m=k_m+w_Gauss(i)*w_Gauss(j)*B_m'*C_m*B_m*det(J);
        
    end
    
end

k_m=t*k_m;

end