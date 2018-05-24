addpath(genpath('../'))

clc
clear all
close all

concrete.section=[-150 -300;150 -300;150 300;-150 300];
concrete.fck=20.75;
fck=concrete.fck;
soc=0.85*fck/1.6;
concrete.constitutivelaw=soc*[10^3,-1.23825*10^5,-1.61536*10^8,6.26558*10^10,-6.58692*10^12];
concrete.E0=1000*soc;

steel.section=[-120 -270 314.2;120 -270 314.2;120 270 314.2;-120 270 314.2];
steel.constitutivelaw=[210000,375];
steel.E0=210000;

elim=[-0.0035,0.01];
    
f0=[0 0 -0.17e9;1 0 0];

tol=10^-5;

fu=ULS(concrete,steel,f0,elim,tol)