

prob = @f_sphere;    
prob = @f_nondiff;   
prob = @f_nondiff2;   
%prob = @f_nondiff2asym;      
%prob = @f_rastrigin;     

gridmin=-10;
gridmax=+10;
deltagrid=0.5;

xgrid = gridmin:deltagrid:gridmax;
ygrid = gridmin:deltagrid:gridmax;
[X,Y] = meshgrid(xgrid,ygrid);

valeur=[];
for i_x=1:length(xgrid)
    for i_y=1:length(ygrid)
        valeur(i_x,i_y)=prob([X(i_x,i_y)  Y(i_x,i_y)]);
    end
end

figuren FIGURE_2D
%surf(X,Y,valeur)
s = surf(X,Y,valeur,'FaceAlpha',0.7)
colorbar
