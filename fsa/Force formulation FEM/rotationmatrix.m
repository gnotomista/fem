function R=rotationmatrix(n1,n2,vr)


x1=(n2-n1)/norm(n2-n1);
x3=cross(x1,vr)/norm(cross(x1,vr));
x2=cross(x3,x1);

r=[x1';
   x2';
   x3'];
o=zeros(3,3);

R=[r,o,o,o;
   o,r,o,o;
   o,o,r,o;
   o,o,o,r];


end