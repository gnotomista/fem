function J=inerzia(P)
R=[0 1;-1 0];
P=[P;P(1,:)];
J=[0 0;0 0];
for i=1:size(P,1)-1
    ri=P(i,:)';
    rj=P(i+1,:)';
    rjo=R*rj;
    J=J+(ri'*rjo)*(ri*ri'+1/2*(ri*rj'+rj*ri')+rj*rj');
end
J=1/12*J;
end