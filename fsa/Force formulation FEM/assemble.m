function [Ki,fi]=assemble(Ki,fi,Fei,fei,R,T,ni,nf)


Kel=T'*(Fei\T);
Keg=R'*Kel*R;

fel=T'*fei;
feg=R'*fel;

Ki(6*ni-5:6*ni,6*ni-5:6*ni)=Ki(6*ni-5:6*ni,6*ni-5:6*ni)+Keg(1:6,1:6);
Ki(6*ni-5:6*ni,6*nf-5:6*nf)=Ki(6*ni-5:6*ni,6*nf-5:6*nf)+Keg(1:6,7:12);
Ki(6*nf-5:6*nf,6*ni-5:6*ni)=Ki(6*nf-5:6*nf,6*ni-5:6*ni)+Keg(7:12,1:6);
Ki(6*nf-5:6*nf,6*nf-5:6*nf)=Ki(6*nf-5:6*nf,6*nf-5:6*nf)+Keg(7:12,7:12);

fi(6*ni-5:6*ni)=fi(6*ni-5:6*ni)+feg(1:6);
fi(6*nf-5:6*nf)=fi(6*nf-5:6*nf)+feg(7:12);


end