function S=secproperty(concrete,steel,ui,m)


M=[0 1;-1 0];

e0i=ui(1);

gi=ui(2:3);

P=concrete.section;

n=length(P);

P(n+1,:)=P(1,:);

a=concrete.constitutivelaw;

Sc=0;

for q=0:4
    
    for i=1:n
        
        ri=P(i,:)';
        
        rj=P(i+1,:)';
        
        rjo=M*rj;
        
        for j=1:2*m
            
            for k=0:q
                
                Sc=Sc+(Bq(m,q,a,e0i)*(ri'*rjo)*ERRE(m,j,i,P)*...
                    nchoosek(q,k)/nchoosek(m+q,k+clERRE(m,j))*...
                    (ri'*gi)^(q-k)*(rj'*gi)^k);
                
            end
            
        end
        
    end
    
end

Ss=secpropsteel(steel,ui,m);

S=Sc+Ss;


end