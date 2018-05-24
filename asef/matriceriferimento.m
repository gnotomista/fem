function R=matriceriferimento(ri,rf,v)
x3=(rf-ri)/norm(rf-ri);
x2=cross(x3,v)/norm(cross(x3,v));
x1=cross(x2,x3);
r=[x1';x2';x3'];
% r ha sulle RIGHE le componenti, nel riferimento GLOBALE,
% dei versori del riferimento LOCALE: è, quindi, la matrice
% del cambio di riferimento GLOBALE --> LOCALE
o=zeros(3,3);
R=[r o o o;
   o r o o;
   o o r o;
   o o o r];
end