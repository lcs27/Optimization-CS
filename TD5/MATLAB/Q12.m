function f = Q12(x)
[stab, tr, D, delta_phi, u_max] = f_simul_magnetic(log(x),0);
if stab>0
    f=stab;
else
    f=-1/tr;
end
end