function D_m=displacement_operator_m(r,s)

D_m=1/4*[(1+r)*(1+s), (1-r)*(1+s), (1-r)*(1-s), (1+r)*(1-s), 0, 0, 0, 0;
         0, 0, 0, 0, (1+r)*(1+s), (1-r)*(1+s), (1-r)*(1-s), (1+r)*(1-s)];
    
end