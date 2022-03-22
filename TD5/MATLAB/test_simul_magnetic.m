
%% simul_magnetic function

K =  1
Ti = 0.1
Td = 0.02
Tf = 0.001

x = log10([K, Ti, Td, Tf]);

f_simul_magnetic(x,1); % pour affichage uniquement

[stab, tr, D, delta_phi, u_max] = f_simul_magnetic(x,0) % pas d'affichage

