function lmbd=lambda(l,e)


i=length(e)+1;

j=1;

while (e(j)>0) && (j<=i-1)
    
    j=j+1;
    
end

if j==i
    
    cond=1;
    
else
    
    cond=0;
    
end

if cond==0
    
    [ln,en,lp,ep]=lenp(l,e);
    
    lmbd=(ep*ln-en*lp)/(ep-en);
    
else
    
    if e(i-1)<e(i-2)
        
        lmbd=(e(i-2)*l(i-1)-e(i-1)*l(i-2))/(e(i-2)-e(i-1));
        
    else
        
        lmbd=l(i-1)+2*(l(i-1)-l(i-2));
        
    end
    
end


end