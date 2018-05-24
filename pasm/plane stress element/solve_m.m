function node=solve_m(node,element)

[K_m,F_m,v]=assemble_m(node,element);

constr=find(v);
free=find(ones(length(v),1)-v);

Kll=K_m(free,free);
Kvl=K_m(constr,free);

d_m=zeros(length(F_m),1);

d_m(free)=Kll\F_m(free);
F_m(constr)=Kvl*d_m(free);

n=length(node);

for f=1:n
    
    node(f).forces(1)=F_m(f);
    node(f).forces(2)=F_m(f+n);
    node(f).forces(3)=F_m(f+2*n);
    node(f).displacement(1)=d_m(f);
    node(f).displacement(2)=d_m(f+n);
    node(f).displacement(3)=d_m(f+2*n);

end

end