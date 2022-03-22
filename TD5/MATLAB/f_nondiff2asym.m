function f = f_nondiff2asym(x)

x=x(:);

A=0*x+1;
B=0*x+4;
epsilon=0.1;

T1=sqrt(sqrt(sum((x+B).^2)));
T2=sqrt(sqrt(sum((x-B).^2)));
T3=sqrt(sqrt(sum((2*B).^2)));
T4=epsilon* (A'*(x-B))/(A'*(2*B));

f=T1+T2-T3-T4;

end