function [up,vp] = projhyperslab(u,v,delta)
% [up,vp] = projhyperslab(u,v,delta): project onto Hyperslab
% Projection of a point (u,v) in R2 to a domain C={|u-v|<=delta}

d = u-v;

if abs(d) <= delta
    t = 0;
elseif d > delta
    t = (delta-u+v)/2;
elseif d < -delta
   t = (-delta-u+v)/2;
end

up = u+t;
vp = v-t;

    

