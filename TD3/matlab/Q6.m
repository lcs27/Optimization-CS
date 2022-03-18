Main
%% Q6
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
A6=eye(15);
A=[zeros(n,5*n),A6,-A5,zeros(n,8*n)];
b=zeros(n,1);

%Solution
[x_tilde,fval]=intlinprog(c,1:(n*n),A,b,L,ones(2*n,1),lower_bound,upper_bound);
Boxes=ConvPlot(x_tilde,n);
PlotSolution (Boxes, PositionsObjects, PositionsBoxes);
