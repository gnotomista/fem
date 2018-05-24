function Bq=Bq(m,q,a,e0i)


Aq=0;

for r=0:q
    
    for s=0:4-q
        
        Aq=Aq+(-1)^r*factorial(m+1)/factorial(2+m+r)*...
            factorial(q)/factorial(q-r)*nchoosek(s+q,s)*...
            a(s+q+1)*e0i;
        
    end
    
end

Bq=Aq/(m+q+1);


end