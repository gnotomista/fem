function [ln,en,lp,ep]=lenp(l,e)


i=length(e)+1;

c1=1;
c2=1;

for j=1:i-1
    
    if e(j)<0
        
        lni(c1)=l(c1);
        
        ni(c1)=j;
        
        c1=c1+1;
        
    else
        
        lpi(c2)=l(c2);
        
        pi(c2)=j;
        
        c2=c2+1;
        
    end
    
end

[ln,index1]=min(lni);

en=e(ni(index1));

[lp,index2]=max(lpi);

ep=e(pi(index2));


end