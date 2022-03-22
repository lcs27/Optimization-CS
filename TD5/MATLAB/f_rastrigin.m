function cout = f_rastrigin(x)

A = 10;
n = length(x);
lambda=0.5;
x=x*lambda;
cout = A*n + sum(x.^2 - A*cos(2*pi*x));
