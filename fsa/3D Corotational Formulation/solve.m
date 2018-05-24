function node=solve(node,element)


d=zeros(6*length(node),1);

[K,f,v]=assemble(node,element);

constr=find(v);
free=find(-v+ones(length(v),1));

d(free)=K(free,free)\f(free);
f(constr)=K(constr,free)*d(free);

for n=1:length(node)
    
    node(n).forces=f(6*n-5:6*n);
    node(n).displacements=d(6*n-5:6*n);
    
end


end