function r=rvector(node,element)


Rr=Rrmatrix(node,element);
r1=Rr(:,1);

o=zeros(1,3);

r=[-r1',o,r1',o];


end