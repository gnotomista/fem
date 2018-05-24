function node=solveFFFincr(node,element,Nsteps,tol,C)


[Ki,f,v]=assemble0(node,element);

Df=f/Nsteps;

di=zeros(length(f),1);

for e=1:length(element)
    
    elemi(e).sect(1).st=zeros(4,1);
    elemi(e).sect(2).st=zeros(4,1);
    elemi(e).fe=zeros(6,1);
    elemi(e).sect(1).e=zeros(4,1);
    elemi(e).sect(2).e=zeros(4,1);
    
end

for k=1:Nsteps
    
    disp('                                               ')
    disp('_______________________________________________')
    disp('                                               ')
    disp('N E W  L O A D  S T E P  =  ')
    disp(k)
    disp('_______________________________________________')
    disp('                                               ')
    
    fk=k*Df;
    
    dki=solve0(Ki,Df,v);
    
    [Ki,fi,elemi]=NF(node,element,dki,elemi);
    
    r=residual(fk,fi,v);
    
    R=norm(r);  % display
    
    cont=0;
    
    disp('Iteration n. ');
    disp(cont)
    disp('Residual: ')
    disp(R)
        
    while R>tol && cont<100

        cont=cont+1;
               
        Dd=solve0(Ki,r,v);
                
        [Ki,fi,elemi]=NF(node,element,Dd,elemi);
        
        dki=dki+Dd;
        
        r=residual(fk,fi,v);
        
        R=norm(r);
        
        disp('-----------------------------------------------')
        disp('Iteration n. ');
        disp(cont)
        disp('Residual: ')
        disp(R)
            
    end
        
    di=di+dki;
    
    %%%%%%%%%%%% --- CREARE UNA FUNZIONE A PARTE --- %%%%%%%%%%%%%%%%%%%%%%
    c=(C(1)-1)*6+C(2);
    
    hold on
    
    plot(abs(di(c)),abs(fk(c)),'*');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end

for n=1:length(node)
    
    node(n).forces=fi(6*n-5:6*n);
    node(n).displacements=di(6*n-5:6*n);
    
end


end