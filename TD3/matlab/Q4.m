Main
%% Q4
%Definition of L4
L3=[zeros(n-1,n+1),eye(n-1),-eye(n-1),zeros(n-1,n*n-3*n+1)];
L=[L;L3];
%Solve!
[x_tilde,fval]=linprog(c,[],[],L,[ones(2*n,1);zeros(n-1,1)],lower_bound,upper_bound);
Boxes=ConvPlot(x_tilde,n);
PlotSolution (Boxes, PositionsObjects, PositionsBoxes);