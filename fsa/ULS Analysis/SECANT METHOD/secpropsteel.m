function Ss=secpropsteel(steel,ui,m)


e0i=ui(1);

gi=ui(2:3);

CL=steel.constitutivelaw;
% CL è il vettore [E,sy]
E=CL(1);

sy=CL(2);

ey=sy/E;

P=steel.section;

Ss=0;

for i=1:length(P)
    
    ri=P(i,1:2)';
    
    Ai=P(i,3);
    
    e=e0i+gi'*ri;
    
    if (e>-ey) && (e<ey)
        
        Es=E;
        
    else
        
        Es=sy/abs(e);
        
    end
    
    switch m
        
        case 0
            
            Ss=Ss+Es*Ai;
            
        case 1
            
            Ss=Ss+Es*Ai*ri;
            
        case 2
            
            Ss=Ss+Es*Ai*(ri*ri');
            
    end
    
end


end