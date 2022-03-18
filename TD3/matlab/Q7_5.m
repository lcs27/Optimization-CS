Main
%% uniqueness for Q5
%Definition of A
A5=[];
for i=1:n
    if i<=4
        A5=[A5;ones(1,i+3),zeros(1,n-(i+3))];
    else if i>=12
        A5=[A5;zeros(1,i-4),ones(1,n+4-i)];
        else
            A5=[A5;zeros(1,i-4),ones(1,7),zeros(1,n-i-3)];
        end
    end
end
A4=eye(15);
A=[zeros(n,3*n),A4,A5,zeros(n,10*n)];
b=ones(n,1);

%Solution
[x_tilde1,fval1]=intlinprog(c,1:(n*n),A,b,L,ones(2*n,1),lower_bound,upper_bound);

%New solution
A=[A;x_tilde1'];
b=[b;n-1];

[x_tilde2,fval2]=intlinprog(c,1:(n*n),A,b,L,ones(2*n,1),lower_bound,upper_bound);
%examine
if abs(fval1-fval2)<1e-5
    disp('not unique');

    Boxes=ConvPlot(x_tilde1,n);
    %PlotSolution (Boxes, PositionsObjects, PositionsBoxes);

    Boxes=ConvPlot(x_tilde2,n);
    PlotSolution (Boxes, PositionsObjects, PositionsBoxes);
else
    disp('unique');
end



