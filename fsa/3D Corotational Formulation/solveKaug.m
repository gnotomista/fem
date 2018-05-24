function [dp,dl]=solveKaug(Kt,f,Dp,Dl,psi,g,a,free)


Kaug=[Kt(free,free),-f(free);
    2*(Dp(free))',2*Dl*psi^2*(f'*f)];

d=-Kaug\[g(free);a];

dp=zeros(length(f),1);
dp(free)=d(1:length(free));

dl=d(length(d));


end