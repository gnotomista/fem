function [node,Dl0,Dp0,DL,f,v,free,R]=fisrtNRiter(node,element,nstep,psi,tol,C)


Dd=zeros(6*length(node),1);

[~,f,v]=assemble(node,element);

free=find(-v+ones(length(v),1));

Df=f/nstep;

[K,~,~]=assemble(node,element);

Dd(free)=K(free,free)\Df(free);

for n=1:length(node)
    
    node(n).displacements=Dd(6*n-5:6*n);
    
end

fi=resistingforces(node,element);

[r,R]=residual(Df,fi,v);

iter=0;

while R>tol && iter<100
    
    iter=iter+1;
    
    [K,~,~]=assemble(node,element);
    
    Dd(free)=K(free,free)\r(free);
    
    for n=1:length(node)
        
        node(n).displacements=node(n).displacements+Dd(6*n-5:6*n);
        
    end
    
    fi=resistingforces(node,element);
    
    [r,R]=residual(Df,fi,v);
    
end

drawdiagram(C,node,fi,1);

Dl0=1/nstep;

Dp0=zeros(6*length(node),1);

for n=1:length(node)
    
    Dp0(6*n-5:6*n)=node(n).displacements;
        
end

DL=sqrt(Dp0'*Dp0+psi^2*Dl0^2*(f'*f));


end