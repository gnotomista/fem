function [node,element]=read_ne(listanodi,listaelementi)

nodes = fopen(listanodi);
N=textscan(nodes,'%d %f %f %f');
fclose(nodes);

elem = fopen(listaelementi);
E=textscan(elem,'%d %*d %*d %*d %*d %*d %d %d %d %d');
fclose(elem);


num_n=N{1};
ics=N{2};
ipsilon=N{3};
zeta=N{4};

for i=1:length(num_n)
    
    idntf_n=num_n(i);
    
    node(idntf_n).coordinates=[ics(i);ipsilon(i);zeta(i)];
    
end


num_e=E{1};
conn1=E{2};
conn2=E{3};
conn3=E{4};
conn4=E{5};

for i=1:length(num_e)
    
    idntf_e=num_e(i);
    
    element(idntf_e).connections=[conn1(i);conn2(i);conn3(i);conn4(i)];
    
end

end