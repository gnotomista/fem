addpath(genpath('../'))

clc
clear all
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   PRE-PROCESSOR   %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% create nodes & elements %%%

[node,element]=read_ne('NLIST1.txt','ELIST1.txt');
% [node,element]=read_ne('NLIST2.txt','ELIST2.txt');

%%% material properties %%%

for e=1:length(element)
    
    element(e).t=0.1;
    element(e).E=2e8;
    element(e).ni=0.3;
    element(e).Y=1000;
    element(e).coeff=1.5;
    
end

%%% define constraints %%%

for n=1:length(node)
    
    C=node(n).coordinates;
    if C(2)==0
        node(n).constraints=[0;1;1];
    else if C(1)==60
            node(n).constraints=[1;0;1];
        else
            node(n).constraints=[0;0;1];
        end
    end
    
end

%%% define loads %%%

for n=1:length(node)
    
    C=node(n).coordinates;
    if C(2)==100
        node(n).forces=[0;100;0];
    else
        node(n).forces=[0;0;0];
    end
    
end

for e=1:length(element)
    
    element(e).load=[0;0];
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%   SOLVING   %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

node=solve_m(node,element);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  POST-PROCESSOR   %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% plotting %%%

plotstructure(node,element,'undeformed',1);
%plotstructure(node,element,'deformed',10000);
plot_vonMises(node,element);
%element=test_plot_sigma(node,element,1);

%%% stress %%%

%node=stress(node,element);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%     END     %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%