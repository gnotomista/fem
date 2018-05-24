function sigma_vonMises=sigma_eq_vonMises(sigma)

sx=sigma(1);
sy=sigma(2);
txy=sigma(3);

sigma_vonMises=sqrt(sx^2+sy^2-sx*sy+3*txy^2);

end