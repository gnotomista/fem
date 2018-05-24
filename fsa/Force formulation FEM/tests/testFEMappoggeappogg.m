addpath(genpath('../'))

clc
clear all
close all

node(1).xyz=[0;0;0];
node(2).xyz=[500;0;0];
node(3).xyz=[1000;0;0];

element(1).connections=[1;2];
element(2).connections=[2;3];

for i=1:length(element)
    
    element(i).material.E=210000;
    element(i).material.Et=210000/10;
    element(i).material.G=77000;
    element(i).material.sy=220;
    
    square=[-10,-10;10,-10;10,10;-10,10;-10,-10];
    element(i).section(1).vertices=square;
    element(i).section(2).vertices=square;
    element(i).reference=[0;1;0];
    
end

node(1).constraints=[1;1;1;1;0;0];
node(2).constraints=[0;0;0;0;0;0];
node(3).constraints=[0;1;1;0;0;0];

node(1).forces=[0;0;0;0;0;0];
node(2).forces=[0;-10*10^3;0;0;0;0];
node(3).forces=[0;0;0;0;0;0];

Nsteps=100;

tol=10^-2;

C=[2,2]; % node [C(1)] and force component [C(2)] to display vs dual displacement


%%%%%%%%%%%%%%   SOLVING   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

node=solveFFFincr(node,element,Nsteps,tol,C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%