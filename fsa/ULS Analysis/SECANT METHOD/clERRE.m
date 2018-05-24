function clR=clERRE(m,j)


switch m
    
    case 0
        
        clR=0;
        
    case 1
        
        switch j
            
            case 1
                
                clR=0;
                
            case 2
                
                clR=1;
                
        end
        
    case 2
        
        switch j
            
            case 1
                
                clR=0;
                
            case 2
                
                clR=1;
                
            case 3
                
                clR=1;
                
            case 4
                
                clR=2;
                
        end
        
        
end