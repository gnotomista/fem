addpath(genpath('../'))

clc
clear all
nodo(1).xyz=[0;0;0];
nodo(2).xyz=[10;0;0];
trave(1).connessione=[1 2];
trave(1).E=210000;
trave(1).G=70000;
trave(1).sezione=[1 0;1 1;0 1;0 0];
trave(1).carichi=[0;0;10;0;0;0];
trave(1).riferimento=[0;1;0];
nodo(1).azioni=[0;0;0;0;0;0];
nodo(2).azioni=[0;0;0;0;0;0];
nodo(1).vincoli=[1;1;1;1;1;1];
nodo(2).vincoli=[1;1;1;1;1;1];
trave(1).vincoli=[1;1;1;1;1;1;1;1;1;1;1;1];
nodo=risolvi(nodo,trave);