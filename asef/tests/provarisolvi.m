addpath(genpath('../'))

clc
clear all
close all
nodo(1).xyz=[0;0;0];
nodo(2).xyz=[10;0;0];
nodo(3).xyz=[20;0;0];
trave(1).connessione=[1 2];
trave(2).connessione=[2 3];
trave(1).E=206000;
trave(1).G=77000;
cerchio=zeros(400,2);
a=0;
for r=1:400
    a=a+2*pi/400;
    cerchio(r,:)=.5*[cos(a) sin(a)];
end
sezione=baricentrasezione(cerchio);
trave(1).sezione=sezione;
trave(1).carichi=[0;0;0;0;0;0];
trave(1).riferimento=[0;1;0];
trave(1).densita=7800;
nodo(1).masse=[0;0;0;0;0;0];
nodo(2).masse=[0;0;0;0;0;0];
trave(2).E=206000;
trave(2).G=77000;
trave(2).sezione=sezione;
trave(2).carichi=[0;0;0;0;0;0];
trave(2).riferimento=[0;1;0];
trave(2).densita=7800;
nodo(3).masse=[0;0;0;0;0;0];
nodo(1).azioni=[0;0;0;0;0;0];
nodo(2).azioni=[0;0;10;0;0;0];
nodo(3).azioni=[0;0;0;0;0;0];
nodo(1).vincoli=[1;1;1;1;1;1];
nodo(2).vincoli=[0;0;0;0;0;0];
nodo(3).vincoli=[0;1;1;0;0;0];
trave(1).vincoli=[1;1;1;1;1;1;1;1;1;1;1;1];
trave(2).vincoli=[1;1;1;1;1;1;1;1;1;1;1;1];
[nodo,Mp]=risolvi(nodo,trave);
numero_modi=size(nodo(1).modi,2);
nsez=100;
for modo=1:size(nodo(1).modi,2)
    trave=stress_displacement(nodo,trave,nsez,modo);
    scala=[0.01;0.1;10]; %=[ Mf ; T,N,Mt ; D,Dm ]
    % ! ! ! PERICOLO->vedi plotstruttura per spostamenti modali ! ! !
    plotstruttura(nodo,trave,'Dm',scala);
end