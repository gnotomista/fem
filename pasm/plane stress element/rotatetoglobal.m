function [k_m_g,f_g]=rotatetoglobal(k_m,f,R)

o=zeros(4,1);
O=zeros(8,1);
Oo=O*o';
oO=o*O';
oo=o*o';
Ro=zeros(3,3);

R_g=[R Ro Ro Ro;
     Ro R Ro Ro;
     Ro Ro R Ro;
     Ro Ro Ro R];

k_m_12(1:8,1:8)=k_m;
k_m_12(1:8,9:12)=Oo;
k_m_12(9:12,1:8)=oO;
k_m_12(9:12,9:12)=oo;

f_12(1:8)=f;
f_12(9:12)=o;

k_m_l=k_m_12;
f_l=f_12;

ord1=[1 5 9 2 6 10 3 7 11 4 8 12];
ord2=[1 4 7 10 2 5 8 11 3 6 9 12];

k_m_l_ord=k_m_l(ord1,ord1);
f_l_ord=f_l(ord1)';

k_m_g_ord=R_g*k_m_l_ord*R_g';
f_g_ord=R_g*f_l_ord;

k_m_g=k_m_g_ord(ord2,ord2);
f_g=f_g_ord(ord2);

end