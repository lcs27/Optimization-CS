function f = f_nondiff2(x)

B=0*x+4;

T1=sqrt(sqrt(sum((x+B).^2)));
T2=sqrt(sqrt(sum((x-B).^2)));
T3=sqrt(sqrt(sum((2*B).^2)));
f=T1+T2-T3;

end