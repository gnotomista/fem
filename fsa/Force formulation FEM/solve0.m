function d=solve0(K,f,v)


free=find(-v+ones(length(v),1));

Kff=K(free,free);

d=zeros(length(f),1);

d(free)=Kff\f(free);


end