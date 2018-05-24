function fu=ULS(concrete,steel,f0,elim,tol)


fd=f0(1,:)';
fl=f0(2,:)';

u0=procedureB(concrete,steel,f0);

e=zeros(500,1);

e(1)=err(concrete,steel,u0,elim);

error=e(1);

l=zeros(500,1);

l(1)=0;

if error<0
    
    disp('ERROR: LOADS EXCEED ULTIMATE LIMIT STATE')
    
else
    
    cont=1;
    
    while abs(error)>tol
        
        if cont==1
            
            l(2)=lambda1(concrete,steel,u0,f0,elim);
            
            f=fd+l(2)*fl;
            
            u=procedureB(concrete,steel,f);
            
            e(2)=err(concrete,steel,u,elim);
                        
        end
        
        l(cont+2)=lambda(l,e);
        
        f=fd+l(cont+2)*fl;
        
        u=procedureB(concrete,steel,f);
        
        e(cont+2)=err(concrete,steel,u,elim);
        
        error=e(cont+2)
        
        cont=cont+1
        
    end
    
end

fu=fd+l(cont+1)*fl;


end