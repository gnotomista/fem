function node=solveARCLENGTH(node,element,nstep,psi,tol,C)


% newton-raphson procedure (only first step)

[node,Dl0,Dp0,DL,f,v,free,R]=fisrtNRiter(node,element,nstep,psi,tol,C);

disp('                                               ')
disp('_______________________________________________')
disp('                                               ')
disp('F I R S T  S T E P')
disp('_______________________________________________')
disp('                                               ')
disp('Newton-Raphson iter')
disp('                                               ')
disp('Residual: ')
disp(R)

% arc length procedure

l=Dl0;

Dp=Dp0;

Dl=Dl0;

for k=2:nstep
    
    disp('                                               ')
    disp('_______________________________________________')
    disp('                                               ')
    disp('N E W  S T E P  =  ')
    disp('                                               ')
    disp(k)
    disp('_______________________________________________')
    disp('                                               ')

    for n=1:length(node)
        
        node(n).displacements=node(n).displacements+Dp(6*n-5:6*n);
        
    end
    
    l=l+Dl;
    
    fi=resistingforces(node,element);
    
    [g,~]=residual(fi,l*f,v);
    
    a=Dp'*Dp+psi^2*Dl^2*(f'*f)-DL^2;
    
    R=norm(g)+abs(a);
    
    iter=0;
    
    disp('-----------------------------------------------')
    disp('Arc length iter n. ')
    disp(iter)
    disp('Residual: ')
    disp(R)
    
    while R>tol && iter<100
        
        iter=iter+1;
        
        [K,~,~]=assemble(node,element);
        
        [dp,dl]=solveKaug(K,f,Dp,Dl,psi,g,a,free);
        
        Dp=Dp+dp;
        
        Dl=Dl+dl;
        
        for n=1:length(node)
            
            node(n).displacements=node(n).displacements+dp(6*n-5:6*n);
            
        end
        
        l=l+dl;
        
        fi=resistingforces(node,element);
        
        [g,~]=residual(fi,l*f,v);
        
        a=(Dp'*Dp)+psi^2*Dl^2*(f'*f)-DL^2;
        
        R=norm(g)+abs(a);
        
        disp('-----------------------------------------------')
        disp('Arc length iter n. ')
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