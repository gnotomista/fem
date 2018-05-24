function l=loadmultipliers(node,element)


MSMg=zeros(6*length(node));
GSMg=zeros(6*length(node));

[~,~,v]=assemble(node,element);
free=find(-v+ones(length(v),1));

for e=1:length(element)
    
    ni=element(e).connections(1);
    nf=element(e).connections(2);
    
    MSM=materialstiffness(node,element(e));
    
    MSMg(6*ni-5:6*ni,6*ni-5:6*ni)=MSMg(6*ni-5:6*ni,6*ni-5:6*ni)+MSM(1:6,1:6);
    MSMg(6*ni-5:6*ni,6*nf-5:6*nf)=MSMg(6*ni-5:6*ni,6*nf-5:6*nf)+MSM(1:6,7:12);
    MSMg(6*nf-5:6*nf,6*ni-5:6*ni)=MSMg(6*nf-5:6*nf,6*ni-5:6*ni)+MSM(7:12,1:6);
    MSMg(6*nf-5:6*nf,6*nf-5:6*nf)=MSMg(6*nf-5:6*nf,6*nf-5:6*nf)+MSM(7:12,7:12);
    
end

for e=1:length(element)
    
    ni=element(e).connections(1);
    nf=element(e).connections(2);
    
    GSM=geometricstiffness(node,element(e));
    
    GSMg(6*ni-5:6*ni,6*ni-5:6*ni)=GSMg(6*ni-5:6*ni,6*ni-5:6*ni)+GSM(1:6,1:6);
    GSMg(6*ni-5:6*ni,6*nf-5:6*nf)=GSMg(6*ni-5:6*ni,6*nf-5:6*nf)+GSM(1:6,7:12);
    GSMg(6*nf-5:6*nf,6*ni-5:6*ni)=GSMg(6*nf-5:6*nf,6*ni-5:6*ni)+GSM(7:12,1:6);
    GSMg(6*nf-5:6*nf,6*nf-5:6*nf)=GSMg(6*nf-5:6*nf,6*nf-5:6*nf)+GSM(7:12,7:12);
    
end

[~,L]=eig(-GSMg(free,free)\MSMg(free,free));

l=diag(L);


end