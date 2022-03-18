function p = proxsqrt(x,g)
%PROXSQRT Computation of the proximity operator of 
% f(x) = -g sqrt(x)
% where x and g are vectors of equal dimension

for i = 1:length(x)
    r = roots([1 0 -x(i) -g(i)/2]);
    r = real(r);
    %r.^3-x(i)*r-g/2
    u = r(r>=0).^2;
    %u-x(i)-g*(2*sqrt(u)).^(-1)
    [fmin,imin] = min((u-x(i)).^2/2-g(i)*sqrt(u));
    p(i) = u(imin);
end

p = p(:);
    
end

