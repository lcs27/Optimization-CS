function xp=projCd(x,P,Q,i,delta)
% xp = projCd(x,P,Q,i,delta): projection on the space of Cdi
% Entries:
% - x : the image to be projected
% - P : the vertical limit of each side(P=[ymin,ymax])
% - Q: the horizental limit of each side(Q=[xmin,xmax])
% - i = 1 or 2, where i=1 ==> projection on Cd1 and i=2 ==> projection on Cd2
% - delta, tolerance
xp = x;
for n = P(1)+(i-1):2:P(2)-1
    for m = Q(1)+(i-1):2:Q(2)-1
        [up,vp] = projhyperslab(x(n+1,m+1),x(n,m),delta);
        xp(n,m) = up;
        xp(n,m+1) = vp;
    end
end

end