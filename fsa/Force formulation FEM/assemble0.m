function [K,f,v]=assemble0(node,element)


K=zeros(6*length(node),6*length(node));
f=zeros(6*length(node),1);
v=zeros(6*length(node),1);

for t=1:length(element)
    
    ni=element(t).connections(1);
    nf=element(t).connections(2);
    
    xyzi=node(ni).xyz;
    xyzf=node(nf).xyz;
    
    L=norm(xyzf-xyzi);
    
    E=element(t).material.E;
    G=element(t).material.G;
    
    P=element(t).section(1).vertices;
    
    Ke=elementstiffness0(L,E,G,P);
    
    R=rotationmatrix(xyzi,xyzf,element(t).reference);
    T=RBMmatrix(L);
    
    Kl=T'*Ke*T;

    Kg=R'*Kl*R;
    
    K(6*ni-5:6*ni,6*ni-5:6*ni)=K(6*ni-5:6*ni,6*ni-5:6*ni)+Kg(1:6,1:6);
    K(6*ni-5:6*ni,6*nf-5:6*nf)=K(6*ni-5:6*ni,6*nf-5:6*nf)+Kg(1:6,7:12);
    K(6*nf-5:6*nf,6*ni-5:6*ni)=K(6*nf-5:6*nf,6*ni-5:6*ni)+Kg(7:12,1:6);
    K(6*nf-5:6*nf,6*nf-5:6*nf)=K(6*nf-5:6*nf,6*nf-5:6*nf)+Kg(7:12,7:12);
    
end

for i=1:length(node)
    
    f(6*i-5:6*i)=f(6*i-5:6*i)+node(i).forces;
    v(6*i-5:6*i)=v(6*i-5:6*i)+node(i).constraints;
    
end


end