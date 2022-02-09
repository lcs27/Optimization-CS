% Tutorial 1: Convex Optimization
% ST7 Optimization - CentraleSupelec
% contact: jean-christophe@pesquet.eu

clear all
close all

% load images
load lena
load lena_noise

figure(1)
imshow(lena)
title('original image')
figure(2)
imshow(lena_noise)
title('noisy image')

x = lena;
clear lena
y = lena_noise;
clear lena_noise

% define noisy area
P(1) = 140;
Q(1) = 140;
P(2) = 170;
Q(2) = 170;

% question 6
delta = 0.2;

nitm = 2000;
[xp,E] = POCS(y,P,Q,delta,nitm,x);

figure(3)
plot(E)
xlabel('$n$','interpreter','latex','FontSize', 20)
ylabel('$\|x_n-\bar{x}\|$','interpreter','latex','FontSize', 20)

% question 7

% visual impact of delta
delta = 0.01;
[xp,E] = POCS(y,P,Q,delta,nitm,x);
figure(4)
imshow(xp)
title('Restored, delta = 0.01')

delta = 0.07;
[xp,E] = POCS(y,P,Q,delta,nitm,x);
figure(5)
imshow(xp)
title('Restored, delta = 0.07')

delta = 0.1;
[xp,E] = POCS(y,P,Q,delta,nitm,x);
figure(6)
imshow(xp)
title('Restored, delta = 0.1')

% determination of the best delta
nit = [];
EE = [];
deltarange = 0.01:1e-3:0.2;
for delta = deltarange
    [xp,E] = POCS(y,P,Q,delta,nitm,x);
    nit = [nit length(E)];
    EE = [EE E(end)];
end

[Emin,imin] = min(EE);
deltaopt = deltarange(imin)

figure(7)
plot(deltarange,EE)
xlabel('$\delta$','interpreter','latex','FontSize', 20)
ylabel('Norm of the error','FontSize', 15)

figure(8)
plot(deltarange,nit)
xlabel('$\delta$','interpreter','latex','FontSize', 20)
ylabel('Number of iterations','FontSize', 15)

% question 8
delta = deltaopt;
[xd,E] = Dykstra(y,P,Q,delta,nitm,x);

figure(9)
imshow(xd)
title('Restoration with Dykstra')

[xpopt,E] = POCS(y,P,Q,deltaopt,nitm,x);
fprintf(1,'POCS: ||y-PC(y)|| = %g\n',norm(xpopt-y));
fprintf(1,'Dykstra: ||y-PC(y)|| = %g\n',norm(xd-y));



