function S=statico(P)
R=[0 1;-1 0];
P=[P;P(1,:)];
S=[0;0];
for i=1:size(P,1)-1
    ri=P(i,:)';
    rj=P(i+1,:)';
    rjo=R*rj;
    S=S+(ri'*rjo)*(ri+rj);
end
S=1/6*S;
end