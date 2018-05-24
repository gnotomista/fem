function C_m=elasticity_matrix_m(E,ni)

C_m=E/(1-ni^2)*[1 ni 0;
                ni 1 0;
                0 0 (1-ni)/2];
          
end