function xp = projC1(x,P,Q,i,delta)

xp = x;
for n = P(1):P(2)
    for m = Q(1)+i:2:Q(2)-1
        [up,vp] = projhyperslab(x(n,m),x(n,m+1),delta);
        xp(n,m) = up;
        xp(n,m+1) = vp;
    end
end

end

