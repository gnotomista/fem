function [K,f,v]=assemble(node,element)


K=zeros(6*length(node));
f=zeros(6*length(node),1);
v=zeros(6*length(node),1);

for e=1:length(element)
    
    ni=element(e).connections(1);
    nf=element(e).connections(2);
    
    Ke=globalelementstiffness(node,element(e));
    
    K(6*ni-5:6*ni,6*ni-5:6*ni)=K(6*ni-5:6*ni,6*ni-5:6*ni)+Ke(1:6,1:6);
    K(6*ni-5:6*ni,6*nf-5:6*nf)=K(6*ni-5:6*ni,6*nf-5:6*nf)+Ke(1:6,7:12);
    K(6*nf-5:6*nf,6*ni-5:6*ni)=K(6*nf-5:6*nf,6*ni-5:6*ni)+Ke(7:12,1:6);
    K(6*nf-5:6*nf,6*nf-5:6*nf)=K(6*nf-5:6*nf,6*nf-5:6*nf)+Ke(7:12,7:12);
    
end

for n=1:length(node)
    
    f(6*n-5:6*n)=f(6*n-5:6*n)+node(n).forces;
    v(6*n-5:6*n)=v(6*n-5:6*n)+node(n).constraints;
    
end


end