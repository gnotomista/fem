function A=area(concrete,steel)


M=[0 1;-1 0];

Pc=concrete.section;
Ps=steel.section;
% steel.section è una matrice con n (numero di barre) righe
% e 3 colonne: posizione x, posizione y, area
As=sum(Ps,1)*[0;0;1];

n=length(Pc);

Ac=0;

for i=1:n
    
    ri=Pc(i,:)';
    
    if i<n
        
        j=i+1;
        
    else j=1;
        
    end
    
    rj=Pc(j,:)';
    
    rjo=M*rj;
    
    Ac=Ac+ri'*rjo;
    
end

Ac=Ac/2-As;

A.concrete=Ac-As;
A.steel=As;


end