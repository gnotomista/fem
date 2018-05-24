function [q1,q2,q]=qvector(Rg1,Rg2,R0)


q1=Rg1*R0*[0;1;0];
q2=Rg2*R0*[0;1;0];

q=(q1+q2)/2;


end