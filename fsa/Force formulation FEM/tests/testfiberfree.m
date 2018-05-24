addpath(genpath('../'))

clc
clear all

%%%%% Sezione a I
rect1=[5,-50;5,0;-5,0;-5,-50;5,-50]+25*[zeros(5,1),ones(5,1)];
rect2=[-50,-5;50,-5;50,5;-50,5;-50,-5]+30*[zeros(5,1),ones(5,1)];
rect3=[-50,-5;50,-5;50,5;-50,5;-50,-5]-30*[zeros(5,1),ones(5,1)];
element.section(1).vertices=rect1;
element.section(2).vertices=rect2;
element.section(3).vertices=rect3;
%%%%% Sezione quadrata cava
% cornice_ext=[-25 -25;25 -25;25 25;-25 25;-25 -25];
% cornice_int=99/100*[-25 -25;-25 25;25 25;25 -25;-25 -25];
% element.section(1).vertices=cornice_ext;
% element.section(2).vertices=cornice_int;
element.material.sy=220;
element.material.E=210000;
element.material.Et=210000/10;
element.material.G=77000;

L=1000;

S1=stressoperator(L,-L/(2*sqrt(3)));
S2=stressoperator(L,L/(2*sqrt(3)));

T=RBMmatrix(L);

% e0=[0.0001;0.0001;0.0001;0.0001];
% l1=[0;1;0;0];
% l2=[0;1.04;0;0];
% l3=[0;1.05;0;0];
% e1=l1.*e0;
% e2=l2.*e0;
% e3=l3.*e0;

e=10^-4*[0;0.6;0.45;0];
% e1=10^-4*[0;0.4151;0;0];
% e2=10^-4*[0;0.4714;0;0];
% e3=10^-4*[0;1;0;0];


[Ks,s]=fiberfree(element,e);
% [Ks1,s1]=fiberfree(element,e1);
% [Ks2,s2]=fiberfree(element,e2);
% [Ks3,s3]=fiberfree(element,e3);


% Fe1=L/2*(S1'*(Ks1\S1)+S2'*(Ks1\S2));
% Fe2=L/2*(S1'*(Ks2\S1)+S2'*(Ks2\S2));
% Fe3=L/2*(S1'*(Ks3\S1)+S2'*(Ks3\S2));
% 
% Kel1=T'*(Fe1\T);
% Kel2=T'*(Fe2\T);
% Kel3=T'*(Fe3\T);

% PLOT SEZIONE
figure(1)
axis equal
hold on
for i=1:length(element.section)
    plot(element.section(i).vertices(:,1),element.section(i).vertices(:,2))
end


