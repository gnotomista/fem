function colour=vonMises_colour(sigma_vonMises,sigma_y,s)


%colours RGB

colours(1:3,1)=[0 0 128]; %blu marino
colours(1:3,2)=[0 71 171]; %cobalto
colours(1:3,3)=[0 255 255]; %ciano
colours(1:3,4)=[0 255 0]; %verde
colours(1:3,5)=[173 255 47]; %verde giallo
colours(1:3,6)=[255 255 0]; %giallo
colours(1:3,7)=[255 153 0]; %arancione
colours(1:3,8)=[255 0 0]; %rosso
colours(1:3,9)=[199 21 133]; %rosso violaceo
colours(1:3,10)=[252 15 192]; %rosa shocking

white=[255 255 255];


%colorous RGB MatLab

colour_RGB_MatLab=zeros(3,10);

for i=1:10
    
    colour_RGB_MatLab(1:3,i)=colours(1:3,i)./white';
    
end


%colour evaluation

sigma_max=sigma_y/s;

D=sigma_max/10;

n=ceil(sigma_vonMises/D);

if n<=10
    
    colour=colour_RGB_MatLab(1:3,n)';
    
else
    
    colour=[0 0 0];
    
end


end