function K=secstiff(concrete,steel,ui)


As=secproperty(concrete,steel,ui,0);

Ss=secproperty(concrete,steel,ui,1);

Js=secproperty(concrete,steel,ui,2);

K=[As Ss(1) Ss(2);
   Ss(1) Js(1,1) Js(1,2);
   Ss(2) Js(2,1) Js(2,2)];


end