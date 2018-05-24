function a=alpha(uit,concrete,steel,elim)


e0it=uit(1);
git=uit(2:3);

ecu=elim(1);
esu=elim(2);

P1=concrete.section;
P2=steel.section;

for i=1:length(P1)
    
    ec(i)=abs(ecu)/abs(e0it+git'*P1(i,:)');
    
end

for i=1:length(P2)
    
    es(i)=abs(esu)/abs(e0it+git'*P2(i,1:2)');
    
end

a=min([min(ec),min(es)]);


end