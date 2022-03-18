function y = PPXA(f,L,S,R,g,la,om,nitm,prec)
%PPXA: Maximize f'*sqrt(L y)
% subject to the following constraints:
% y >= 0
% y(1) = S
% y(end) = R (R = [] if no constraint on end value)
% g, la, om, nitm, prec : parameters of the algorithm
% g : stepsize in the prox of the cost function
% la : relaxation parameter, 0 < la < 2
% om : averaging parameter, 0 < om < 1
% nitm : maximum iteration number
% prec : precision accuracy
% PPXA+ algorithm designed by N. Pustelnik and J.-C. Pesquet

if nargin < 4
    error('incorrect number of arguments')
elseif nargin == 4
    g = 100;
    la = 1;
    om = 3/4;
    nitm = 100000;
    prec = 1e-7;
end

K = length(f)+1;
%K = length(f);
t1 = zeros(K-1,1);
%t1 = zeros(K,1);
t2 = zeros(K,1);
p2 = t2;
y = zeros(K,1);

Q = inv(om*L'*L+(1-om)*eye(K));

oldcost = -1;

for nit = 1:nitm
    
    p1 = proxsqrt(t1,g*f);
    
    p2(1) = S;
    if ~isempty(R)
        p2(K) = R;
        p2(2:K-1) = max(t2(2:K-1),0);
    else
        p2(2:K) = max(t2(2:K),0);
    end
    
    
    c = Q*(om*L'*p1+(1-om)*p2);
    
    t1 = t1+la*(L*(2*c-y)-p1);
    t2 = t2+la*(2*c-y-p2);
    
    y = y+la*(c-y);

    newcost = f*sqrt(L*p2);
    
    if rem(nit,100) == 0
%        fprintf(1,'it = %d np1 = %g np2 = %g cost = %g dif =%g\n',nit,norm(L'*p1),norm(p2),newcost,norm(y-p2))
        fprintf(1,'it = %d cost = %g\n',nit,newcost)
    end
    
    %[oldcost newcost]
    if abs(oldcost-newcost) < prec
        break
    end
    oldcost = newcost;
end

y = p2;
    
 end

