addpath(genpath('../'))

clc
clear all
close all

%coordinate nodi
nodo(1).xyz=[0;0;0];
nodo(2).xyz=[200;0;0];
nodo(3).xyz=[200;200;0];
nodo(4).xyz=[0;200;0];
nodo(5).xyz=[100;100;0];
nodo(6).xyz=[100;0;0];
nodo(7).xyz=[200;100;0];
nodo(8).xyz=[100;200;0];
nodo(9).xyz=[0;100;0];
nodo(10).xyz=[0;0;100];
nodo(11).xyz=[200;0;100];
nodo(12).xyz=[200;200;100];
nodo(13).xyz=[0;200;100];
nodo(14).xyz=[100;100;100];
nodo(15).xyz=[100;0;100];
nodo(16).xyz=[200;100;100];
nodo(17).xyz=[100;200;100];
nodo(18).xyz=[0;100;100];
nodo(19).xyz=[0;0;200];
nodo(20).xyz=[200;200;200];
nodo(21).xyz=[0;200;200];
nodo(22).xyz=[100;100;200];
nodo(23).xyz=[100;0;200];
nodo(24).xyz=[200;100;200];
nodo(25).xyz=[100;200;200];
nodo(26).xyz=[0;100;200];

%vincoli nodi
for i=1:9
    nodo(i).vincoli=[1;1;1;1;1;1];
end
for i=10:26
    nodo(i).vincoli=[0;0;0;0;0;0];
end

%azioni nodi
for i=1:26
    nodo(i).azioni=[0;0;0;0;0;0];
end
nodo(11).azioni=[-100;0;0;0;0;0];
nodo(19).azioni=[0;100;0;0;0;0];
nodo(20).azioni=[0;-1000;0;0;0;0];
nodo(21).azioni=[0;0;0;0;0;-1000];

%masse nodi
for i=1:26
    nodo(i).masse=[0;0;0;0;0;0];
end

%connessioni travi
trave(1).connessione=[1;10];
trave(2).connessione=[2;11];
trave(3).connessione=[3;12];
trave(4).connessione=[4;13];
trave(5).connessione=[5;14];
trave(6).connessione=[6;15];
trave(7).connessione=[7;16];
trave(8).connessione=[8;17];
trave(9).connessione=[9;18];
trave(10).connessione=[10;19];
trave(11).connessione=[12;20];
trave(12).connessione=[13;21];
trave(13).connessione=[14;22];
trave(14).connessione=[15;23];
trave(15).connessione=[16;24];
trave(16).connessione=[17;25];
trave(17).connessione=[18;26];
trave(18).connessione=[10;15];
trave(19).connessione=[15;11];
trave(20).connessione=[11;16];
trave(21).connessione=[16;12];
trave(22).connessione=[12;17];
trave(23).connessione=[17;13];
trave(24).connessione=[13;18];
trave(25).connessione=[18;10];
trave(26).connessione=[14;15];
trave(27).connessione=[14;16];
trave(28).connessione=[14;17];
trave(29).connessione=[14;18];
trave(30).connessione=[19;23];
trave(31).connessione=[24;20];
trave(32).connessione=[20;25];
trave(33).connessione=[25;21];
trave(34).connessione=[21;26];
trave(35).connessione=[26;19];
trave(36).connessione=[22;23];
trave(37).connessione=[22;24];
trave(38).connessione=[22;25];
trave(39).connessione=[22;26];

%riferimento travi
for i=1:17
    trave(i).riferimento=[1;0;0];
end
for i=18:39
    trave(i).riferimento=[0;0;1];
end

%caratteristiche comuni travi
quadrato=[-5 -5;5 -5;5 5;-5 5];
for i=1:39
    trave(i).carichi=[0;0;0;0;0;0];
    trave(i).vincoli=[1;1;1;1;1;1;1;1;1;1;1;1];
    trave(i).sezione=quadrato;
    trave(i).E=220000;
    trave(i).G=80000;
    trave(i).densita=7800;
end
trave(36).vincoli=[1;1;1;0;0;0;1;1;1;0;0;1];
trave(37).vincoli=[1;1;1;0;0;0;1;1;1;0;0;1];
trave(38).vincoli=[1;1;1;0;0;0;1;1;1;0;0;1];
trave(39).vincoli=[1;1;1;0;0;0;1;1;1;0;0;1];

trave(37).carichi=[0;10;0;0;0;0];
trave(39).carichi=[0;10;0;0;0;0];





nsez=10;

nodo=risolvi(nodo,trave);

%numero di modo per il calcolo degli SPOSTAMENTI MODALI:
mod=69;

trave=stress_displacement(nodo,trave,nsez,mod);

% seleziona scala diagramma(M,N,T,Mt), deformata(D) o un modo(modal):
s=[0.01;0.1;100];
s_movie=100;

%plotstruttura(nodo,trave,'D',s,create avi? 0 or 1);
modal_movie(nodo,trave,s_movie,1);

numero_modi=size(nodo(1).modi,2);