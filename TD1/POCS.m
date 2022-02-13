function [xp,E]=POCS(x,P,Q,delta,nitm,x_bar)
xp=x;
E=zeros(nitm,1);
for i=1:nitm
    b = mod(i,6);
    if b==1
        xp=projCv(xp,P,Q,1,delta);
    elseif b==2
        xp=projCv(xp,P,Q,2,delta);
    elseif b==3
        xp=projCh(xp,P,Q,1,delta);
    elseif b==4
        xp=projCh(xp,P,Q,2,delta);
    elseif b==5
        xp=projCd(xp,P,Q,1,delta);
    else
        xp=projCd(xp,P,Q,2,delta);
    end
    E(i)=norm(xp-x_bar);
end




end