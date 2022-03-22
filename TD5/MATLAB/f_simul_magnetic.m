%% ************************************************************************
%% ************************************************************************
%% ***                                                                  ***
%% *** Magnetic levitation simulation : evaluation of performances      ***
%% ***                                                                  ***
%% ************************************************************************
%% ************************************************************************
%
% Guillaume Sandou / Stéphane FONT
%
% x : log(K, Ti, Td, Tf)
% trace : plot if trace =1

% Modification de simul_magnetic.m 
% on force : yinf = 1 (vers la ligne 61 - 68); 
% Pour garentir l'utilisation de l'effet intégral et éviter 
% une compensation de l'intégrateur par un pôle en basse fréquence
% lors de l'optimisation

function [stab, tr, D, delta_phi, u_max] = f_simul_magnetic(x, trace)

param = 10.^x;
K = param(1);
Ti = param(2);
Td = param(3);
Tf = param(4);
taud = Td/10;

correcteur = K*(1+tf(1,[Ti 0]) + tf([Td 0], [taud 1]))*tf(1,[Tf 1]);

w0 = 40;
Ksusp = -0.01;
Kact = 0.1;
tau = 0.0005;
be = 4000;
alpha = 1.1;
G2=1.1;
% alpha = 1;
% G2=1;

susp = G2*be*tf(Kact,[tau*alpha 1])*tf(Ksusp,[-1/w0/w0*alpha^2 0*alpha 1]);
BO = correcteur*susp;
% zpk(correcteur)
% zpk(susp)

BF = feedback(BO, 1);

p = pole(BF);

stab = max(real(p));

if stab > 0,
    tr = Inf;
    D = Inf;
    delta_phi = -Inf;
    u_max = Inf;
else
    BO = prescale(ss(BO));
    [Gm,delta_phi,Wcg,Wcp] = margin(BO);
    
    [y, t] = step(BF,1);
    
    D = (max(y) - y(end))/y(end);
    
    % yinf = y(end); % ancienne ligne
    yinf = 1; %% Pour forcer l'utilisation de l'effet intégral et éviter 
    % une compensation de l'intégrateur par un pôle en basse fréquence
    ind = length(t)-1;
    found = 0;
    
    while ~found
        if y(ind) > 1.05*yinf | y(ind) < 0.95*yinf,
            found = 1;
        else
            ind = ind-1;
        end
    end
    
    tr = t(ind+1);
    
    BF_u = feedback(correcteur, susp);
    [u, tu] = step(BF_u,1);
    
    u_max = max(abs(u));
   
    if trace,
        figuren BO ; hold off
        margin(BO);
        grid on ; zoom on ; drawnow
        
        figuren STEP_output ; hold off
        step(BF);
        hold on
        plot([t(1) t(end)], [1.05*y(end) 1.05*y(end)], 'r', [t(1) t(end)], [0.95*y(end) 0.95*y(end)], 'r', t(ind+1), y(ind+1), 'og')
        title('Step response');
        grid on ; zoom on ; drawnow
                
        figuren STEP_control_signal ; hold off
        step(BF_u)
        title('Control signal');
        grid on ; zoom on ; drawnow
    end
end
    