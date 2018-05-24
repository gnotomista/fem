addpath(genpath('../'))

clc
clear all
close all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/1;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-25,-25;25,-25;25,25;-25,25;-25,-25];
    element(i).section(1).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement


%%%%%%%%%%%%%%   SOLVING   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%% I %%%%%%%%%%%%%%%%%%
% Et=E

node=solveFFFincr(node,element,Nsteps,tol,C);
hold on
pause

%%%%%%%%%%%%%%%%% II %%%%%%%%%%%%%%%%%
% Et=E/2

clc
clear all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/2;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-25,-25;25,-25;25,25;-25,25;-25,-25];
    element(i).section(1).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement

node=solveFFFincr(node,element,Nsteps,tol,C);
pause

%%%%%%%%%%%%%%%%% III %%%%%%%%%%%%%%%%
% Et=E/5

clc
clear all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/5;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-25,-25;25,-25;25,25;-25,25;-25,-25];
    element(i).section(1).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement

node=solveFFFincr(node,element,Nsteps,tol,C);
pause

%%%%%%%%%%%%%%%%% IV %%%%%%%%%%%%%%%%%
% Et=E/10

clc
clear all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/10;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-25,-25;25,-25;25,25;-25,25;-25,-25];
    element(i).section(1).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement

node=solveFFFincr(node,element,Nsteps,tol,C);
pause

%%%%%%%%%%%%%%%%% V %%%%%%%%%%%%%%%%%%
% Et=E/100

clc
clear all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/100;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-25,-25;25,-25;25,25;-25,25;-25,-25];
    element(i).section(1).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement

node=solveFFFincr(node,element,Nsteps,tol,C);
pause

%%%%%%%%%%%%%%%%% VI %%%%%%%%%%%%%%%%%%
% Et=E/2
% section = I shape (with same area)

clc
clear all

node(1).xyz=[0;0;0];
node(2).xyz=[1000;0;0];

element(1).connections=[1;2];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/2;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    rect1=[5,-50;5,0;-5,0;-5,-50;5,-50]+25*[zeros(5,1),ones(5,1)];
    rect2=[-50,-5;50,-5;50,5;-50,5;-50,-5]+30*[zeros(5,1),ones(5,1)];
    rect3=[-50,-5;50,-5;50,5;-50,5;-50,-5]-30*[zeros(5,1),ones(5,1)];
    element(i).section(1).vertices=rect1;
    element(i).section(2).vertices=rect2;
    element(i).section(3).vertices=rect3;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;1;1];
node(2).constraints=[0;0;0;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-20e3;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement

% node=solveFFFincr(node,element,Nsteps,tol,C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%