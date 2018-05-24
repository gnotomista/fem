function [Ks,s]=sectionstiffstress(P1,P2,P3,element,e)


E=element.material.E;
Et=element.material.Et;
G=element.material.G;
sy=element.material.sy;

A1=area(P1);
A2=area(P2);
A3=area(P3);

S1=Iareamoment(P1);
S2=Iareamoment(P2);
S3=Iareamoment(P3);

J1=IIareamoment(P1);
J2=IIareamoment(P2);
J3=IIareamoment(P3);

Ks1=[Et*A1, Et*S1(1), Et*S1(2), 0;
    Et*S1(1), Et*J1(1,1), Et*J1(1,2), 0;
    Et*S1(2), Et*J1(2,1), Et*J1(2,2), 0;
    0, 0, 0, G*(J1(1,1)+J1(2,2))];

Ks2=[E*A2, E*S2(1), E*S2(2), 0;
    E*S2(1), E*J2(1,1), E*J2(1,2), 0;
    E*S2(2), E*J2(2,1), E*J2(2,2), 0;
    0, 0, 0, G*(J2(1,1)+J2(2,2))];

Ks3=[Et*A3, Et*S3(1), Et*S3(2), 0;
    Et*S3(1), Et*J3(1,1), Et*J3(1,2), 0;
    Et*S3(2), Et*J3(2,1), Et*J3(2,2), 0;
    0, 0, 0, G*(J3(1,1)+J3(2,2))];

Ks=Ks1+Ks2+Ks3;

s=Ks*e;

s(1)=s(1)+sy*(1-Et/E)*(A3-A1);
s(2:3)=s(2:3)+sy*(1-Et/E)*(S3-S1);


end