function [P1,P2,P3]=division(PT,IT)


P1=[];
P2=[];
P3=[];

for i=1:length(PT)-1
    
    v1=size(P1,1);
    v2=size(P2,1);
    v3=size(P3,1);
    
    if IT(i)==1 || IT(i+1)==1
        
        if v1==0
            
            P1(v1+1,1:2)=PT(i,:);
            P1(v1+2,1:2)=PT(i+1,:);
            
        else
            
            if P1(v1,:)==PT(i,:)
                
                P1(v1+1,1:2)=PT(i+1,:);
                                
            else
                
                P1(v1+1,1:2)=PT(i,:);
                P1(v1+2,1:2)=PT(i+1,:);
                
            end
            
        end
        
    end
    
    if IT(i)==2 || IT(i+1)==2
        
        if v2==0
            
            P2(v2+1,1:2)=PT(i,:);
            P2(v2+2,1:2)=PT(i+1,:);
            
        else
            
            if P2(v2,:)==PT(i,:)
                
                P2(v2+1,1:2)=PT(i+1,:);
                                
            else
                
                P2(v2+1,1:2)=PT(i,:);
                P2(v2+2,1:2)=PT(i+1,:);
                
            end
            
        end
        
    end
    
    if IT(i)==3 || IT(i+1)==3
        
        if v3==0
            
            P3(v3+1,1:2)=PT(i,:);
            P3(v3+2,1:2)=PT(i+1,:);
            
        else
            
            if P3(v3,:)==PT(i,:)
                
                P3(v3+1,1:2)=PT(i+1,:);
                                
            else
                
                P3(v3+1,1:2)=PT(i,:);
                P3(v3+2,1:2)=PT(i+1,:);
                
            end
            
        end
        
    end
    
    if IT(i)==0 && IT(i+1)==0
        
        if v2==0
            
            P2(v2+1,1:2)=PT(i,:);
            P2(v2+2,1:2)=PT(i+1,:);
            
        else
            
            if P2(v2,:)==PT(i,:)
                
                P2(v2+1,1:2)=PT(i+1,:);
                
            else
                
                P2(v2+1,1:2)=PT(i,:);
                P2(v2+2,1:2)=PT(i+1,:);
                
                
            end
            
        end
        
    end
    
end


if ~isempty(P1)
    
    if P1(size(P1,1),:)==P1(1,:)
        
        open1=false;
        
    else
        
        open1=true;
        
    end
    
    if open1
        
        P1(size(P1,1)+1,:)=P1(1,:);
                
    end
    
end

if ~isempty(P2)
    
    if P2(size(P2,1),:)==P2(1,:)
        
        open2=false;
        
    else
        
        open2=true;
        
    end
    
    if open2
        
        P2(size(P2,1)+1,:)=P2(1,:);
                
    end
    
end

if ~isempty(P3)
    
    if P3(size(P3,1),:)==P3(1,:)
        
        open3=false;
        
    else
        
        open3=true;
        
    end
    
    if open3
        
        P3(size(P3,1)+1,:)=P3(1,:);
                
    end
    
end


end