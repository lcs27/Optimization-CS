Main
%% Q3
upper_bound(1)=0;
upper_bound(n)=0;
[x_tilde,fval]=linprog(c,[],[],L,ones(2*n,1),lower_bound,upper_bound);
Boxes=ConvPlot(x_tilde,n);
PlotSolution (Boxes, PositionsObjects, PositionsBoxes);