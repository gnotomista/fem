function [Ks,s]=fiberfree(element,e)


Ks=zeros(4,4);
s=zeros(4,1);

for i=1:length(element.section)
    
    P=element.section(i).vertices; % chiudere la sezione col punto iniziale
    
    epsy=element.material.sy/element.material.E;
    
    [eps,I]=epsIvectors(P,e,epsy);
    
    [PT,IT]=cutpoints(P,eps,I,epsy); % contiene tutti i punti di divisione tra le aree
    
    [P1,P2,P3]=division(PT,IT);
    
    %%%%% PLOT AREE 1 3 2 (sigma<-sigmaY, sigma>sigmaY, -sigmaY<sigma<sigmaY)
%         figure(1)
%         hold on
%         axis equal
%         if ~isempty(P1)
%             patch(P1(:,1),P1(:,2),'r')
%         end
%         if ~isempty(P3)
%             patch(P3(:,1),P3(:,2),'r')
%         end
%         if ~isempty(P2)
%             patch(P2(:,1),P2(:,2),'g')
%         end
    %%%%%
    
    [Ksi,si]=sectionstiffstress(P1,P2,P3,element,e);
    
    Ks=Ks+Ksi;
    
    s=s+si;
    
end


end