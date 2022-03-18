Main
%% uniqueness for Q4
%Definition of L4
L3=[zeros(n-1,n+1),eye(n-1),-eye(n-1),zeros(n-1,n*n-3*n+1)];
L=[L;L3];
%Solve!
[x_tilde1,fval1]=intlinprog(c,1:n^2,[],[],L,[ones(2*n,1);zeros(n-1,1)],lower_bound,upper_bound);
%New solution
A=x_tilde1';
b=n-1;
[x_tilde2,fval2]=intlinprog(c,1:n^2,A,b,L,[ones(2*n,1);zeros(n-1,1)],lower_bound,upper_bound);
%examine
if abs(fval1-fval2)<1e-5
    disp('not unique');
    Boxes=ConvPlot(x_tilde1,n);
    PlotSolution (Boxes, PositionsObjects, PositionsBoxes);

    Boxes=ConvPlot(x_tilde2,n);
    PlotSolution (Boxes, PositionsObjects, PositionsBoxes);
else
    disp('unique');
end


