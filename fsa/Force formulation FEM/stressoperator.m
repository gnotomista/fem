function S=stressoperator(L,x)


S=[1 0 0 0 0 0;
   0 0 0 -x/L+1/2 0 -x/L-1/2;
   0 0 x/L-1/2 0 x/L+1/2 0;
   0 1 0 0 0 0];


end