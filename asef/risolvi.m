function [nodo,Mp]=risolvi(nodo,trave)
[K,M,F,v,C]=assemblaggio(nodo,trave);
gdlv=find(v);
gdll=find(ones(length(v),1)-v);
Kvl=K(gdlv,gdll);
Kll=K(gdll,gdll);
d=zeros(6*length(nodo));
d(gdll)=Kll\F(gdll);
F(gdlv)=Kvl*d(gdll);
Mll=M(gdll,gdll);
W=Mll\Kll;
[phi,w2]=eig(W);
w=zeros(size(w2,1),1);
for i=1:length(w)
    w(i)=sqrt(w2(i,i));
end
[~,ordine]=sort(w);
PHI=zeros(6*length(nodo),size(phi,2));
PHI(gdll,:)=phi(:,ordine);
for n=1:length(nodo)
    nodo(n).azioni=F(6*n-5:6*n);
    nodo(n).spostamenti=d(6*n-5:6*n);
    nodo(n).modi=PHI(6*n-5:6*n,:);
end
Mp=zeros(6,size(PHI,2));
for m=1:size(PHI,2)
    den=PHI(:,m)'*M*PHI(:,m);
    num=(PHI(:,m)'*M*C).^2;
    Mp(:,m)=num/den;
end 