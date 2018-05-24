function e=err(concrete,steel,u,elim)


e0i=u(1);
gi=u(2:3);

ecu=elim(1);
esu=elim(2);

P1=concrete.section;
P2=steel.section;

for i=1:length(P1)
    
    ri=P1(i,:);
    
    ec(i)=e0i+gi'*ri';
    
end

ecmin=min(ec);

for i=1:length(P2)
    
    ri=P2(i,1:2);
    
    es(i)=e0i+gi'*ri';
    
end

esmin=min(es);

e=min([(ecu-ecmin)/ecmin,(esu-esmin)/esmin]);


end