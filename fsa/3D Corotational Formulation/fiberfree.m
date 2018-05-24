function [Ks,s]=fiberfree(element,e)


Ks=zeros(4,4);
s=zeros(4,1);

for i=2:length(element.section)
    
    P=element.section(i).vertices; % chiudere la sezione col punto iniziale
    
    epsy=element.material.sy/element.material.E;
    
    [eps,I]=epsIvectors(P,e,epsy);
    
    [PT,IT]=cutpoints(P,eps,I,epsy); % contiene tutti i punti di divisione tra le aree
    
    [P1,P2,P3]=division(PT,IT);
    
    [Ksi,si]=sectionstiffstress(P1,P2,P3,element,e);
    
    Ks=Ks+Ksi;
    
    s=s+si;
    
end


end