function S=firstareamoment(concrete,steel)


M=[0 1;-1 0];

Pc=concrete.section;
Ps=steel.section;

Ss=[sum(Ps(2).*Ps(3));sum(Ps(1).*Ps(3))];

n=length(Pc);

Sc=[0;0];

for i=1:n
    
    ri=Pc(i,:)';
    
    if i<n
        
        j=i+1;
        
    else j=1;
        
    end
    
    rj=Pc(j,:)';
    
    rjo=M*rj;
    
    Sc=Sc+(ri'*rjo*(ri+rj));
    
end

Sc=Sc/6-Ss;

S.concrete=Sc;
S.steel=Ss;


end