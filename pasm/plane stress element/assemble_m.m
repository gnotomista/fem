function [K_m,F_m,v]=assemble_m(node,element)

n=length(node);

K_m=zeros(3*n);
F_m=zeros(3*n,1);
v=zeros(3*n,1);

for e=1:length(element)
    
    C=element(e).connections;
    X=XYZ(node,C);
    R=rotation_matrix(X);
    t=element(e).t;
    E=element(e).E;
    ni=element(e).ni;
    
    k_m=stiffness_matrix_m(X,t,E,ni);
    
    q=element(e).load;
    Fn_e=distributed_load(X,q);
    
    [k_m_g,f_g]=rotatetoglobal(k_m,Fn_e,R);
    
    for i=1:4
        
        for j=1:4
            
            c=C(i);
            d=C(j);            
            
            K_m(c,d)=K_m(c,d)+k_m_g(i,j);
            K_m(c,d+n)=K_m(c,d+n)+k_m_g(i,j+4);
            K_m(c,d+2*n)=K_m(c,d+2*n)+k_m_g(i,j+8);
            K_m(c+n,d)=K_m(c+n,d)+k_m_g(i+4,j);
            K_m(c+n,d+n)=K_m(c+n,d+n)+k_m_g(i+4,j+4);
            K_m(c+n,d+2*n)=K_m(c+n,d+2*n)+k_m_g(i+4,j+8);
            K_m(c+2*n,d)=K_m(c+2*n,d)+k_m_g(i+8,j);
            K_m(c+2*n,d+n)=K_m(c+2*n,d+n)+k_m_g(i+8,j+4);
            K_m(c+2*n,d+2*n)=K_m(c+2*n,d+2*n)+k_m_g(i+8,j+8);
            
        end
        
    end
    
    for i=1:4
        
        c=C(i);
        
        F_m(c)=F_m(c)+f_g(i);
        F_m(c+n)=F_m(c+n)+f_g(i+4);
        F_m(c+2*n)=F_m(c+2*n)+f_g(i+8);
        
    end
    
end

for f=1:n
    
    Fn_n=node(f).forces;
    
    F_m(f)=F_m(f)+Fn_n(1);
    F_m(f+n)=F_m(f+n)+Fn_n(2);
    F_m(f+2*n)=F_m(f+2*n)+Fn_n(3);
    
    
    vn=node(f).constraints;
    
    v(f)=v(f)+vn(1);
    v(f+n)=v(f+n)+vn(2);
    v(f+2*n)=v(f+2*n)+vn(3);

end

end