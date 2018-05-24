function [PT,IT]=cutpoints(P,eps,I,epsy)

PT=[];
IT=[];

for i=1:length(P)-1

    v=size(PT,1);
    
    switch I(i)*I(i+1)
               
        %%%%%%%%%%%%%%%%%%%%%%%%% caso B.1 %%%%%%%%%%%%%%%%%%%%%%%%%
            
        case 2
            
            if I(i)==1
                
                s=(-epsy-eps(i))/(eps(i+1)-eps(i));
                
                Padd=P(i,:)+s*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=1;
                    IT(v+2)=0;
                    IT(v+3)=2;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=2;
                                                
                    else
                        
                        IT(v+1)=1;
                        IT(v+2)=0;
                        IT(v+3)=2;
                        
                    end
                    
                end
                
            else
                
                s=(epsy+eps(i))/(eps(i)-eps(i+1));
                
                Padd=P(i,:)+s*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=2;
                    IT(v+2)=0;
                    IT(v+3)=1;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=1;
                        
                    else
                        
                        IT(v+1)=2;
                        IT(v+2)=0;
                        IT(v+3)=1;
                                                
                    end
                    
                end
                
            end
            
            if v==0
                
                PT(v+1,1:2)=P(i,:);
                PT(v+2,1:2)=Padd;
                PT(v+3,1:2)=P(i+1,:);
                
            else
                
                if PT(v,:)==P(i,:)
                    
                    PT(v+1,1:2)=Padd;
                    PT(v+2,1:2)=P(i+1,:);
                    
                else
                    
                    PT(v+1,1:2)=P(i,:);
                    PT(v+2,1:2)=Padd;
                    PT(v+3,1:2)=P(i+1,:);
                                                            
                end
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%% caso B.2 %%%%%%%%%%%%%%%%%%%%%%%%%
            
        case 6
            
            if I(i)==2
                
                s=(epsy-eps(i))/(eps(i+1)-eps(i));
                
                Padd=P(i,:)+s*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=2;
                    IT(v+2)=0;
                    IT(v+3)=3;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=3;
                        
                    else
                        
                        IT(v+1)=2;
                        IT(v+2)=0;
                        IT(v+3)=3;
                        
                    end
                    
                end
                
            else
                
                s=(eps(i)-epsy)/(eps(i)-eps(i+1));
                
                Padd=P(i,:)+s*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=3;
                    IT(v+2)=0;
                    IT(v+3)=2;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=2;
                        
                    else
                        
                        IT(v+1)=3;
                        IT(v+2)=0;
                        IT(v+3)=2;
                                                
                    end
                    
                end
                
            end
            
            if v==0
                
                PT(v+1,1:2)=P(i,:);
                PT(v+2,1:2)=Padd;
                PT(v+3,1:2)=P(i+1,:);
                
            else
                
                if PT(v,:)==P(i,:)
                    
                    PT(v+1,1:2)=Padd;
                    PT(v+2,1:2)=P(i+1,:);
                                        
                else
                    
                    PT(v+1,1:2)=P(i,:);
                    PT(v+2,1:2)=Padd;
                    PT(v+3,1:2)=P(i+1,:);
                                        
                end
                
            end
                       
        %%%%%%%%%%%%%%%%%%%%%%%%% caso C %%%%%%%%%%%%%%%%%%%%%%%%%
                        
        case 3
            
            if I(i)==1
                
                s1=(-epsy-eps(i))/(eps(i+1)-eps(i));
                s2=(epsy-eps(i))/(eps(i+1)-eps(i));
                
                Padd1=P(i,:)+s1*(P(i+1,:)-P(i,:));
                Padd2=P(i,:)+s2*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=1;
                    IT(v+2)=0;
                    IT(v+3)=0;
                    IT(v+4)=3;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=0;
                        IT(v+3)=3;
                        
                    else
                        
                        IT(v+1)=1;
                        IT(v+2)=0;
                        IT(v+3)=0;
                        IT(v+4)=3;
                        
                    end
                    
                end
                
            else
                
                s1=(eps(i)-epsy)/(eps(i)-eps(i+1));
                s2=(eps(i)+epsy)/(eps(i)-eps(i+1));
                
                Padd1=P(i,:)+s1*(P(i+1,:)-P(i,:));
                Padd2=P(i,:)+s2*(P(i+1,:)-P(i,:));
                
                if v==0
                    
                    IT(v+1)=3;
                    IT(v+2)=0;
                    IT(v+3)=0;
                    IT(v+4)=1;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=0;
                        IT(v+2)=0;
                        IT(v+3)=1;
                        
                    else
                        
                        IT(v+1)=3;
                        IT(v+2)=0;
                        IT(v+3)=0;
                        IT(v+4)=1;
                        
                    end
                    
                end
                
            end
            
            if v==0
                
                PT(v+1,1:2)=P(i,:);
                PT(v+2,1:2)=Padd1;
                PT(v+3,1:2)=Padd2;
                PT(v+4,1:2)=P(i+1,:);
                
            else
                
                if PT(v,:)==P(i,:)
                    
                    PT(v+1,1:2)=Padd1;
                    PT(v+2,1:2)=Padd2;
                    PT(v+3,1:2)=P(i+1,:);
                    
                else
                    
                    PT(v+1,1:2)=P(i,:);
                    PT(v+2,1:2)=Padd1;
                    PT(v+3,1:2)=Padd2;
                    PT(v+4,1:2)=P(i+1,:);
                                        
                end
                
            end
            
        %%%%%%%%%%%%%%%%%%%%%%%%% caso A %%%%%%%%%%%%%%%%%%%%%%%%%
            
        otherwise
            
            if v==0
                
                PT(v+1,1:2)=P(i,:);
                PT(v+2,1:2)=P(i+1,:);
                
            else
                
                if PT(v,:)==P(i,:)
                    
                    PT(v+1,1:2)=P(i+1,:);
                    
                else
                    
                    PT(v+1,1:2)=P(i,:);
                    PT(v+2,1:2)=P(i+1,:);
                    
                end
                
            end
            
            if I(i)==1
                
                if v==0
                    
                    IT(v+1)=1;
                    IT(v+2)=1;
                    
                else
                    
                    if PT(v,:)==P(i,:)
                        
                        IT(v+1)=1;
                        
                    else
                        
                        IT(v+1)=1;
                        IT(v+2)=1;
                        
                    end
                    
                end
                
            else
                
                if I(i)==2
                    
                    if v==0
                        
                        IT(v+1)=2;
                        IT(v+2)=2;
                        
                    else
                        
                        if PT(v,:)==P(i,:)
                            
                            IT(v+1)=2;
                            
                        else
                            
                            IT(v+1)=2;
                            IT(v+2)=2;
                            
                        end
                        
                    end
                    
                else
                    
                    if v==0
                        
                        IT(v+1)=3;
                        IT(v+2)=3;
                        
                    else
                        
                        if PT(v,:)==P(i,:)
                            
                            IT(v+1)=3;
                            
                        else
                            
                            IT(v+1)=3;
                            IT(v+2)=3;
                            
                        end
                        
                    end
                    
                end
                
            end
            
    end
    
end


if PT(size(PT,1),:)==PT(1,:)
    
    open=false;
    
else
    
    open=true;
    
end

if open
    
    PT(size(PT,1)+1,:)=PT(1,:);
    
    IT(length(IT)+1)=IT(1);
    
end


end