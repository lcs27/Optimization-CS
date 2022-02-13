function [xd,E] = Dykstra(x,P,Q,delta,nitm,x_bar)
for m=1:6
    xs(:,:,m)=x;
    d(:,:,m)=zeros(size(x));
    e(:,:,m)=zeros(size(x));
end
E=zeros(nitm,1);
for i=1:nitm
    for m=1:6
        if m==1
            e(:,:,m)=xs(:,:,6)+d(:,:,m);
            xs(:,:,m)=projCv(e(:,:,m),P,Q,1,delta);
        elseif m==2
            e(:,:,m)=xs(:,:,m-1)+d(:,:,m);
            xs(:,:,m)=projCv(e(:,:,m),P,Q,2,delta);
        elseif m==3
            e(:,:,m)=xs(:,:,m-1)+d(:,:,m);
           xs(:,:,m)=projCh(e(:,:,m),P,Q,1,delta);
        elseif m==4
            e(:,:,m)=xs(:,:,m-1)+d(:,:,m);
           xs(:,:,m)=projCh(e(:,:,m),P,Q,2,delta);
       elseif m==5
           e(:,:,m)=xs(:,:,m-1)+d(:,:,m);
           xs(:,:,m)=projCd(e(:,:,m),P,Q,1,delta);
        else
           e(:,:,m)=xs(:,:,m-1)+d(:,:,m);
           xs(:,:,m)=projCd(e(:,:,m),P,Q,2,delta);
    end
    d(:,:,m)=e(:,:,m)-xs(:,:,m);
    end
    E(i)=norm(xs(:,:,6)-x_bar);
end
xd=xs(:,:,6);
end
