function [Ki,fi,elemi]=NF(node,element,Dd,elemh)


Ki=zeros(6*length(node));
fi=zeros(6*length(node),1);

for b=1:length(element)
    
    [Ddi,L,R,T,ni,nf]=deassemble(node,element(b),Dd);
    
    sth1=elemh(b).sect(1).st;
    sth2=elemh(b).sect(2).st;
    feh=elemh(b).fe;
    eh1=elemh(b).sect(1).e;
    eh2=elemh(b).sect(2).e;
    
    [Ksh1,sh1]=fiberfree(element(b),eh1);
    [Ksh2,sh2]=fiberfree(element(b),eh2);
           
    S1=stressoperator(L,-L/(2*sqrt(3)));
    S2=stressoperator(L,L/(2*sqrt(3)));
        
    Feh=L/2*(S1'*(Ksh1\S1)+S2'*(Ksh2\S2));
    
    Dfi=Feh\Ddi;
    
    Dsi1=S1*Dfi+sth1;
    Dsi2=S2*Dfi+sth2;
    
    Dei1=Ksh1\Dsi1;
    Dei2=Ksh2\Dsi2;
    
    ei1=eh1+Dei1;
    ei2=eh2+Dei2;
    
    [Ksi1,si1]=fiberfree(element(b),ei1);
    [Ksi2,si2]=fiberfree(element(b),ei2);
    
    Fei=L/2*(S1'*(Ksi1\S1)+S2'*(Ksi2\S2));
    
    et1=Ksi1\(Dsi1-(si1-sh1));
    et2=Ksi2\(Dsi2-(si2-sh2));
    
    dt=L/2*(S1'*et1+S2'*et2);
    
    fei=feh+Dfi-Fei\dt;
    
    sti1=S1*fei-si1;
    sti2=S2*fei-si2;
    
    elemi(b).sect(1).st=sti1;
    elemi(b).sect(2).st=sti2;
    elemi(b).fe=fei;
    elemi(b).sect(1).e=ei1;
    elemi(b).sect(2).e=ei2;
    
    [Ki,fi]=assemble(Ki,fi,Fei,fei,R,T,ni,nf);
    
end


end