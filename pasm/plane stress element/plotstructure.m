function plotstructure(node,element,d,scale)

for e=1:length(element)
    
    hold on
    
    if strcmp(d,'undeformed')
        
        plotelement(node,element(e),'undeformed',scale);
        
    else
        
        plotelement(node,element(e),'deformed',scale);
        
    end
    
end

axis image

end