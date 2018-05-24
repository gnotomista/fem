function [eps,I]=epsIvectors(P,e,epsy)


I=zeros(length(P),1);

eps=zeros(length(P),1);

for i=1:length(P)
    
    eps(i)=[1,P(i,:)]*e(1:3);
    
    if eps(i)<=-epsy
        
        I(i)=1;
        
    else if eps(i)>=epsy
            
            I(i)=3;
            
        else I(i)=2;
            
        end
        
    end
    
end


end