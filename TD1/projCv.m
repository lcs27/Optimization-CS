function xp=projCv(x,P,Q,i,delta)
% xp = projCv(x,P,Q,i,delta): projection on the space of Cvi
% Entries:
% - x : the image to be projected
% - P : the vertical limit of each side(P=[ymin,ymax])
% - Q: the horizental limit of each side(Q=[xmin,xmax])
% - i = 1 or 2, where i=1 ==> projection on Cv1 and i=2 ==> projection on Cv2
% - delta, tolerance
xp = x;
for n = P(1)+(i-1):2:P(2)-1
    for m = Q(1):Q(2)
        [up,vp] = projhyperslab(x(n,m),x(n+1,m),delta);
        xp(n,m) = up;
        xp(n+1,m) = vp;
    end
end

end
