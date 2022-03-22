function f = Q14(x)
[stab, tr, D, delta_phi, u_max] = f_simul_magnetic(log(x),0);
if stab>0
    f=stab;
else
    lambda=100;
    beta=100;
    f=-1/(tr+exp(lambda/10*(u_max-10))+exp(beta/45*(45-delta_phi)))
    %f=-1/(tr+2);
end
end