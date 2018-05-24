addpath(genpath('../'))

clc
clear all
close all

node(1).xyz=[0;0;0.6];
node(2).xyz=[0;15;0];
node(3).xyz=[-15*sqrt(3)/2;-15/2;0];
node(4).xyz=[15*sqrt(3)/2;-15/2;0];
node(5).xyz=[0;7/8*15*sqrt(3)/2;1/8*0.6];
node(6).xyz=[-7/8*15*sqrt(3)/2;-7/8*15/2;1/8*0.6];
node(7).xyz=[7/8*15*sqrt(3)/2;-7/8*15/2;1/8*0.6];
node(8).xyz=[0;6/8*15*sqrt(3)/2;2/8*0.6];
node(9).xyz=[-6/8*15*sqrt(3)/2;-6/8*15/2;2/8*0.6];
node(10).xyz=[6/8*15*sqrt(3)/2;-6/8*15/2;2/8*0.6];
node(11).xyz=[0;5/8*15*sqrt(3)/2;3/8*0.6];
node(12).xyz=[-5/8*15*sqrt(3)/2;-5/8*15/2;3/8*0.6];
node(13).xyz=[5/8*15*sqrt(3)/2;-5/8*15/2;3/8*0.6];
node(14).xyz=[0;4/8*15*sqrt(3)/2;4/8*0.6];
node(15).xyz=[-4/8*15*sqrt(3)/2;-4/8*15/2;4/8*0.6];
node(16).xyz=[4/8*15*sqrt(3)/2;-4/8*15/2;4/8*0.6];
node(17).xyz=[0;3/8*15*sqrt(3)/2;5/8*0.6];
node(18).xyz=[-3/8*15*sqrt(3)/2;-3/8*15/2;5/8*0.6];
node(19).xyz=[3/8*15*sqrt(3)/2;-3/8*15/2;5/8*0.6];
node(20).xyz=[0;2/8*15*sqrt(3)/2;6/8*0.6];
node(21).xyz=[-2/8*15*sqrt(3)/2;-2/8*15/2;6/8*0.6];
node(22).xyz=[2/8*15*sqrt(3)/2;-2/8*15/2;6/8*0.6];
node(23).xyz=[0;1/8*15*sqrt(3)/2;7/8*0.6];
node(24).xyz=[-1/8*15*sqrt(3)/2;-1/8*15/2;7/8*0.6];
node(25).xyz=[1/8*15*sqrt(3)/2;-1/8*15/2;7/8*0.6];

element(1).connections=[1,23];
element(2).connections=[23,20];
element(3).connections=[20,17];
element(4).connections=[17,14];
element(5).connections=[14,11];
element(6).connections=[11,8];
element(7).connections=[8,5];
element(8).connections=[5,2];
element(9).connections=[1,25];
element(10).connections=[25,22];
element(11).connections=[22,19];
element(12).connections=[19,16];
element(13).connections=[16,13];
element(14).connections=[13,10];
element(15).connections=[10,7];
element(16).connections=[7,4];
element(17).connections=[1,24];
element(18).connections=[24,21];
element(19).connections=[21,18];
element(20).connections=[18,15];
element(21).connections=[15,12];
element(22).connections=[12,9];
element(23).connections=[9,6];
element(24).connections=[6,3];

%plotstructure(node,element)

for e=1:length(element)
    
    element(e).reference=[0;0;1];
    element(e).material.E=10^7;
    element(e).material.Et=10^7/1;
    element(e).material.G=3.8462*10^6;
    element(e).material.sy=220;
    element(e).section(1).vertices=[-0.17/2,-0.14/2;0.17/2,-0.14/2;0.17/2,0.14/2;-0.17/2,0.14/2;-0.17/2,-0.14/2];
    element(e).section(2).vertices=[-0.17/2,-0.14/2;0.17/2,-0.14/2;0.17/2,0.14/2;-0.17/2,0.14/2;-0.17/2,-0.14/2];
    
end

for n=1:length(node)
    
    node(n).constraints=[0;0;0;0;0;0];
    node(n).forces=[0;0;0;0;0;0];
    node(n).displacements=[0;0;0;0;0;0];
    
end
node(2).constraints=[1;1;1;1;1;1];
node(3).constraints=[1;1;1;1;1;1];
node(4).constraints=[1;1;1;1;1;1];

node(1).forces=[0;0;-30;0;0;0];


nstep=15;

psi=0.05;

tol=10^-1;

C=[1,3];



%node=solveITER(node,element,nstep,tol,C);
node=solveARCLENGTH(node,element,nstep,psi,tol,C);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
clc
clear all

node(1).xyz=[0;0;0.6];
node(2).xyz=[0;15;0];
node(3).xyz=[-15*sqrt(3)/2;-15/2;0];
node(4).xyz=[15*sqrt(3)/2;-15/2;0];
node(5).xyz=[0;7/8*15*sqrt(3)/2;1/8*0.6];
node(6).xyz=[-7/8*15*sqrt(3)/2;-7/8*15/2;1/8*0.6];
node(7).xyz=[7/8*15*sqrt(3)/2;-7/8*15/2;1/8*0.6];
node(8).xyz=[0;6/8*15*sqrt(3)/2;2/8*0.6];
node(9).xyz=[-6/8*15*sqrt(3)/2;-6/8*15/2;2/8*0.6];
node(10).xyz=[6/8*15*sqrt(3)/2;-6/8*15/2;2/8*0.6];
node(11).xyz=[0;5/8*15*sqrt(3)/2;3/8*0.6];
node(12).xyz=[-5/8*15*sqrt(3)/2;-5/8*15/2;3/8*0.6];
node(13).xyz=[5/8*15*sqrt(3)/2;-5/8*15/2;3/8*0.6];
node(14).xyz=[0;4/8*15*sqrt(3)/2;4/8*0.6];
node(15).xyz=[-4/8*15*sqrt(3)/2;-4/8*15/2;4/8*0.6];
node(16).xyz=[4/8*15*sqrt(3)/2;-4/8*15/2;4/8*0.6];
node(17).xyz=[0;3/8*15*sqrt(3)/2;5/8*0.6];
node(18).xyz=[-3/8*15*sqrt(3)/2;-3/8*15/2;5/8*0.6];
node(19).xyz=[3/8*15*sqrt(3)/2;-3/8*15/2;5/8*0.6];
node(20).xyz=[0;2/8*15*sqrt(3)/2;6/8*0.6];
node(21).xyz=[-2/8*15*sqrt(3)/2;-2/8*15/2;6/8*0.6];
node(22).xyz=[2/8*15*sqrt(3)/2;-2/8*15/2;6/8*0.6];
node(23).xyz=[0;1/8*15*sqrt(3)/2;7/8*0.6];
node(24).xyz=[-1/8*15*sqrt(3)/2;-1/8*15/2;7/8*0.6];
node(25).xyz=[1/8*15*sqrt(3)/2;-1/8*15/2;7/8*0.6];

element(1).connections=[1,23];
element(2).connections=[23,20];
element(3).connections=[20,17];
element(4).connections=[17,14];
element(5).connections=[14,11];
element(6).connections=[11,8];
element(7).connections=[8,5];
element(8).connections=[5,2];
element(9).connections=[1,25];
element(10).connections=[25,22];
element(11).connections=[22,19];
element(12).connections=[19,16];
element(13).connections=[16,13];
element(14).connections=[13,10];
element(15).connections=[10,7];
element(16).connections=[7,4];
element(17).connections=[1,24];
element(18).connections=[24,21];
element(19).connections=[21,18];
element(20).connections=[18,15];
element(21).connections=[15,12];
element(22).connections=[12,9];
element(23).connections=[9,6];
element(24).connections=[6,3];

%plotstructure(node,element)

for e=1:length(element)
    
    element(e).reference=[0;0;1];
    element(e).material.E=10^7;
    element(e).material.Et=10^7/2;
    element(e).material.G=3.8462*10^6;
    element(e).material.sy=220;
    element(e).section(1).vertices=[-0.17/2,-0.14/2;0.17/2,-0.14/2;0.17/2,0.14/2;-0.17/2,0.14/2;-0.17/2,-0.14/2];
    element(e).section(2).vertices=[-0.17/2,-0.14/2;0.17/2,-0.14/2;0.17/2,0.14/2;-0.17/2,0.14/2;-0.17/2,-0.14/2];
    
end

for n=1:length(node)
    
    node(n).constraints=[0;0;0;0;0;0];
    node(n).forces=[0;0;0;0;0;0];
    node(n).displacements=[0;0;0;0;0;0];
    
end
node(2).constraints=[1;1;1;1;1;1];
node(3).constraints=[1;1;1;1;1;1];
node(4).constraints=[1;1;1;1;1;1];

node(1).forces=[0;0;-30;0;0;0];


nstep=15;

psi=0.05;

tol=10^-1;

C=[1,3];



%node=solveITER(node,element,nstep,tol,C);
node=solveARCLENGTH(node,element,nstep,psi,tol,C);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%