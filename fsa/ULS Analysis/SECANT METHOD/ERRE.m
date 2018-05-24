function R=ERRE(m,j,i,P)


switch m
    
    case 0
        
        R=1;
        
    case 1
        
        switch j
            
            case 1
                
                R=P(i,:)';
                
            case 2
                
                R=P(i+1,:)';
                
        end
        
    case 2
        
        switch j
            
            case 1
                
                R=P(i,:)*P(i,:)';
                
            case 2
                
                R=P(i,:)*P(i+1,:)';
                
            case 3
                
                R=P(i+1,:)*P(i,:)';
                
            case 4
                
                R=P(i+1,:)*P(i+1,:)';
                
        end
        
        
end