addpath(genpath('../../'))

clc
clear all
close all

node(1).xyz=[0;0;0];
node(2).xyz=[100;0;0];
node(3).xyz=[200;0;0];
node(4).xyz=[300;0;0];
node(5).xyz=[400;0;0];
node(6).xyz=[500;0;0];
node(7).xyz=[600;0;0];
node(8).xyz=[700;0;0];
node(9).xyz=[800;0;0];
node(10).xyz=[900;0;0];
node(11).xyz=[1000;0;0];

element(1).connections=[1,2];
element(2).connections=[2,3];
element(3).connections=[3,4];
element(4).connections=[4,5];
element(5).connections=[5,6];
element(6).connections=[6,7];
element(7).connections=[7,8];
element(8).connections=[8,9];
element(9).connections=[9,10];
element(10).connections=[10,11];

for e=1:length(element)
    
    element(e).reference=[0;0;1];
    element(e).material.E=10^7;
    element(e).material.Et=10^7/10;
    element(e).material.G=3.8462*10^6;
    element(e).material.sy=220;
    element(e).section(1).vertices=5*[-10,-10;10,-10;10,10;-10,10;-10,-10];
    element(e).section(2).vertices=5*[-10,-10;10,-10;10,10;-10,10;-10,-10];
        
end

for n=1:length(node)
    
    node(n).constraints=[0;0;0;0;0;0];
    node(n).forces=[0;0;0;0;0;0];
    node(n).displacements=[0;0;0;0;0;0];
    
end

node(1).constraints=[1;1;1;1;1;1];

node(11).forces=[-1000*10^6;0;-1000*10^6;0;0;0];


nstep=1;

psi=0.05;

tol=10^-1;

C=[1,3];



%node=solveITER(node,element,nstep,tol,C);
%node=solveARCLENGTH(node,element,nstep,psi,tol,C);

l=loadmultipliers(node,element);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%