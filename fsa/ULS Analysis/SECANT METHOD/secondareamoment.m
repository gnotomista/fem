function J=secondareamoment(concrete,steel)


M=[0 1;-1 0];

Pc=concrete.section;
Ps=steel.section;

Js=[sum(Ps(2).*Ps(2).*Ps(3)) sum(Ps(2).*Ps(1).*Ps(3));
    sum(Ps(1).*Ps(2).*Ps(3)) sum(Ps(1).*Ps(1).*Ps(3))];

n=length(Pc);

Jc=[0 0;
    0 0];

for i=1:n
    
    ri=Pc(i,:)';
    
    if i<n
        
        j=i+1;
        
    else j=1;
        
    end
    
    rj=Pc(j,:)';
    
    rjo=M*rj;
    
    Jc=Jc+(ri'*rjo*((ri*ri')+(ri*rj'+rj*ri')/2+(rj*rj')));
    
end

Jc=Jc/12-Js;

J.concrete=Jc;
J.steel=Js;


end