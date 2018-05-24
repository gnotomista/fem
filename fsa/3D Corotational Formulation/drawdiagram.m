function drawdiagram(C,node,fi,k)


hold on

ddrw=node(C(1)).displacements;
fdrw=fi(6*(C(1)-1)+C(2));

% plot(abs(ddrw(C(2))),abs(fdrw),'*')
% 
% text(abs(ddrw(C(2))),abs(fdrw),int2str(k));

plot(ddrw(C(2)),fdrw,'*')

text(ddrw(C(2)),fdrw,int2str(k));


end