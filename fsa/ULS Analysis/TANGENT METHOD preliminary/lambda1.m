function l=lambda1(concrete,steel,u0,f0,elim)


fl=f0(2,:)';

ecu=elim(1);
esu=elim(2);

P1=concrete.section;
P2=steel.section;

for i=1:length(P1)
    
    r(1)=1;
    r(2:3)=P1(i,:);
    
    a=uo'*r;
    
    b=(tangentoperator(f,u0)\fl)'*r;
    
    lc(i)=(ecu-a)/b;
    
end

lcmin=min(lc);

for i=1:length(P2)
    
    r(1)=1;
    r(2:3)=P2(i,1:2);
    
    a=uo'*r;
    
    b=(tangentoperator(f,u0)\fl)'*r;
    
    ls(i)=(esu-a)/b;
    
end

lsmin=min(ls);

l=min([lcmin,lsmin]);


end