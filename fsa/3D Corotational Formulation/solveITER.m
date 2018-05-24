function node=solveITER(node,element,nstep,tol,C)


Dd=zeros(6*length(node),1);

[~,f0,v]=assemble(node,element);

free=find(-v+ones(length(v),1));

Df=f0/nstep;

for k=1:nstep
    
    disp('                                               ')
    disp('_______________________________________________')
    disp('                                               ')
    disp('N E W  L O A D  S T E P  =  ')
    disp('                                               ')
    disp(k)
    disp('_______________________________________________')
    disp('                                               ')
    
    fk=k*Df;
    
    [K,~,~]=assemble(node,element);
    
    Dd(free)=K(free,free)\Df(free);
        
    for n=1:length(node)
        
        node(n).displacements=node(n).displacements+Dd(6*n-5:6*n);
        
    end
    
    fi=resistingforces(node,element);
    
    [r,R]=residual(fk,fi,v);
    
    iter=0;
    
    disp('Iteration n. ')
    disp(iter)
    disp('Residual: ')
    disp(R)
    
    while R>tol && iter<100
        
        iter=iter+1;
        
        [K,~,~]=assemble(node,element);
        
        Dd(free)=K(free,free)\r(free);
                
        for n=1:length(node)
            
            node(n).displacements=node(n).displacements+Dd(6*n-5:6*n);
            
        end
        
        fi=resistingforces(node,element);
        
        [r,R]=residual(fk,fi,v);
        
        disp('-----------------------------------------------')
        disp('Iteration n. ')
        disp(iter)
        disp('Residual: ')
        disp(R)
        
    end
    
    drawdiagram(C,node,fi,k);
        
end

for n=1:length(node)
    
    node(n).forces=node(n).forces+fi(6*n-5:6*n);
    
end


end