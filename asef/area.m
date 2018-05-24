function A=area(P)
R=[0 1;-1 0];
P=[P;P(1,:)];
A=0;
for i=1:size(P,1)-1
    ri=P(i,:)';
    rj=P(i+1,:)';
    rjo=R*rj;
    A=A+ri'*rjo;
end
A=1/2*A;
end