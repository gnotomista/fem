function node=stress(node,element)

for e=1:length(element)
    
    connections=element(e).connections;
    
    X=XYZ(node,connections);
    x=translrotatetolocal(X);
    
    R=rotation_matrix(X);
    
    E=element(e).E;
    ni=element(e).ni;
    
    C=elasticity_matrix_m(E,ni);
    
    u=zeros(8,1);
    
    for n=1:4
        
        c=connections(n);
        
        d_g=node(c).displacement';
        
        d_l=R'*d_g;
        
        u(n)=d_l(1);
        u(n+4)=d_l(2);
        
    end
    
    rs=[1 1;-1 1;-1 -1;1 -1];
    
    for n=1:4
        
        r=rs(n,1);
        s=rs(n,2);
        
        B=strain_operator_m(x,r,s);
        
        eps=B*u;
        
        sigma=C*eps;
        
        c=connections(n);
        
        node(c).stresses=sigma;
        
    end
    
end


end