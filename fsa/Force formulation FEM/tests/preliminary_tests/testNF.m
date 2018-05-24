addpath(genpath('../../'))

clc
clear all

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
node(2).forces=[0;-100;0;0;0;0];
node(3).forces=[0;0;0;0;0;0];


[K,f,v]=assemble0(node,element);
[Dd,elem0]=solve0(K,f,v,element);
[Ki,fi,elemi]=NF(node,element,Dd,elem0);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%