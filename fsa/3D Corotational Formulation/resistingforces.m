function fi=resistingforces(node,element)


fi=zeros(6*length(node),1);

for e=1:length(element)
    
    ni=element(e).connections(1);
    nf=element(e).connections(2);
    
    xyzi=node(ni).xyz;
    xyzf=node(nf).xyz;
    
    di=node(ni).displacements;
    df=node(nf).displacements;
    
    d=[di;df];
    
    B=Bmatrix(node,element(e));
    
    dl=B*d;
    
    ui=di(1:3);
    uf=df(1:3);
    
    ln=norm(xyzf+uf-xyzi-ui);
    
    B1=strainoperator(ln,-ln/(2*sqrt(3)));
    B2=strainoperator(ln,ln/(2*sqrt(3)));
    
    rbm=[7,4,5,6,10,11,12];
    
    e1=B1(:,rbm)*dl;
    e2=B2(:,rbm)*dl;
    
    [~,s1]=fiberfree(element(e),e1);
    [~,s2]=fiberfree(element(e),e2);
    
    fl=ln/2*((B1(:,rbm))'*s1+(B2(:,rbm))'*s2);
    
    fg=B'*fl;
    
    fi(6*ni-5:6*ni)=fi(6*ni-5:6*ni)+fg(1:6);
    fi(6*nf-5:6*nf)=fi(6*nf-5:6*nf)+fg(7:12);
    
end


end