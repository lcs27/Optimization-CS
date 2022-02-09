clear all
close all
%%
%partial but not directional derivatives

xa=-2:0.01:2;
ya=-2:0.01:2;
for i=0:400
    for j=0:400
        x=-2+4*i/400;
        y=-2+4*j/400;
        z(i+1,j+1)=(x*y)/(x^2+y^2);
    end
end
z(201,201)=0;
surf(xa,ya,z);
figure
contour(xa,ya,z);

%%
%directional derivatives but not Gateaux

xa=-2:0.05:2;
ya=-2:0.05:2;
for i=0:80
    for j=0:80
        x=-2+4*i/80;
        y=-2+4*j/80;
        if x*y>0
            z1(i+1,j+1)=(x^2*y)/(x^2+y^2);
        else
            z1(i+1,j+1)=0;
        end
    end
end
%z(201,201)=0;
surf(xa,ya,z1);
figure
contour(xa,ya,z1);

%%
%Gateaux derivatives at 0 but not Frechet at 0
clear all
xa=-2:0.05:2;
ya=-2:0.05:2;
for i=0:80
    for j=0:80
        x=-2+4*i/80;
        y=-2+4*j/80;
        z2(i+1,j+1)=(abs(x)^3*y)/(x^4+y^2);
    end
end
z2(41,41)=0;
figure 
surf(xa,ya,z2);
figure
contour(xa,ya,z2);

%%
%Yet another example of function allowing Gateaux derivatives at 0 but not
%Frechet at 0 (see Ex3 in the slides of the course 2)
clear all
xa=-2:0.01:2;
ya=-2:0.01:2;
for i=0:400
    for j=0:400
        x=-2+4*i/400;
        y=-2+4*j/400;
        z2(i+1,j+1)=(x^4*y)/(x^6+y^3);
    end
end
z2(201,201)=0;
surf(xa,ya,z2);
axis([-0.5 0.5 -0.5 0.5 -10 10]) 
figure
contour(xa,ya,z2);