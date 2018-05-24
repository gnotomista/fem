function K=stiff(concrete,steel)


A=area(concrete,steel);
S=firstareamoment(concrete,steel);
J=secondareamoment(concrete,steel);

Ec=concrete.E0;
Es=steel.E0;

Ac=A.concrete;
Sc=S.concrete;
Jc=J.concrete;

As=A.steel;
Ss=S.steel;
Js=J.steel;

Kc=Ec*[Ac Sc(1) Sc(2);
       Sc(1) Jc(1,1) Jc(1,2);
       Sc(2) Jc(2,1) Jc(2,2)];
   
Ks=Es*[As Ss(1) Ss(2);
       Ss(1) Js(1,1) Js(1,2);
       Ss(2) Js(2,1) Js(2,2)];

K=Kc+Ks;


end