function element=test_plot_sigma(node,element,comp)


for e=1:length(element)
    
    connections=element(e).connections;
    
    X=XYZ(node,connections);
    x=translrotatetolocal(X);
    
    R=rotation_matrix(X);
    
    E=element(e).E;
    ni=element(e).ni;
    sigma_y=element(e).Y;
    coeff=element(e).coeff;
    
    C=elasticity_matrix_m(E,ni);
    
    for r=-1:0.1:1
        
        for s=-1:0.1:1
            
            B=strain_operator_m(x,r,s);
            
            u=zeros(8,1);
            
            for n=1:4
                
                c=connections(n);
                
                d_g=node(c).displacement';
                
                d_l=R'*d_g;
                
                u(n)=d_l(1);
                u(n+4)=d_l(2);
                
            end
            
            eps=B*u;
            
            sigma=C*eps;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if r==-1 && s==1
                
                element(e).stress=sigma;
                
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            sigmatoplot=sigma(comp);
            
            clr=colour(sigmatoplot,sigma_y,coeff);
            
            P=chi(X,[r,s]);
            
            plot(P(1),P(2),'o','Color',clr);
            
        end
        
    end
    
end

end