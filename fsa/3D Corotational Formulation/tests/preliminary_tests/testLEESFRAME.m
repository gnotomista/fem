addpath(genpath('../../'))

clc
clear all
close all

node(1).xyz=[0;0;0];
node(2).xyz=[0;12;0];
node(3).xyz=[0;24;0];
node(4).xyz=[0;36;0];
node(5).xyz=[0;48;0];
node(6).xyz=[0;60;0];
node(7).xyz=[0;72;0];
node(8).xyz=[0;84;0];
node(9).xyz=[0;96;0];
node(10).xyz=[0;108;0];
node(11).xyz=[0;120;0];
node(12).xyz=[12;120;0];
node(13).xyz=[24;120;0];
node(14).xyz=[36;120;0];
node(15).xyz=[48;120;0];
node(16).xyz=[60;120;0];
node(17).xyz=[72;120;0];
node(18).xyz=[84;120;0];
node(19).xyz=[96;120;0];
node(20).xyz=[108;120;0];
node(21).xyz=[120;120;0];

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
element(11).connections=[11,12];
element(12).connections=[12,13];
element(13).connections=[13,14];
element(14).connections=[14,15];
element(15).connections=[15,16];
element(16).connections=[16,17];
element(17).connections=[17,18];
element(18).connections=[18,19];
element(19).connections=[19,20];
element(20).connections=[20,21];

% plotstructure(node,element)
% pause

for e=1:length(element)
    
    element(e).reference=[0;0;1];
    element(e).material.E=720;
    element(e).material.Et=720/1;
    element(e).material.G=300;
    element(e).material.sy=15;
    element(e).section(1).vertices=[-1,-1.5;1,-1.5;1,1.5;-1,1.5;-1,-1.5];
    element(e).section(2).vertices=[-1,-1.5;1,-1.5;1,1.5;-1,1.5;-1,-1.5];
    
end

for n=1:length(node)
    
    node(n).constraints=[0;0;0;0;0;0];
    node(n).forces=[0;0;0;0;0;0];
    node(n).displacements=[0;0;0;0;0;0];
    
end
node(1).constraints=[1;1;1;0;1;0];
node(21).constraints=[1;1;1;0;0;0];

node(13).forces=[0;-10;0;0;0;0];


nstep=100;

psi=1;

tol=10^-1;

C=[13,2];



%node=solveITER(node,element,nstep,tol,C);
node=solveARCLENGTH(node,element,nstep,psi,tol,C);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%