%% Initialisation
clear all;  close all;  clc
% load the data
T=readtable('PositionsObjects.txt'); PositionsObjects=T.x+1i*T.y;  % positions defined by complex numbers
T=readtable('PositionsBoxes.txt');   PositionsBoxes=T.x+1i*T.y;

%% Plot example with object i in the box i (1 in 1, 2 in 2, etc.)
n = length (PositionsObjects);   % number of objects 
Boxes = 1:n;
%PlotSolution (Boxes, PositionsObjects, PositionsBoxes)

%% Q2
% Definition of c
c=zeros(n*n,1);
for i=1:n
    for j=1:n
        c((j-1)*n+i)=norm(PositionsObjects(j)-PositionsBoxes(i));
    end
end

%Definition of L
L1=[];
for i=1:n
    L1=blkdiag(L1,ones(n,1)');
end
L2=[];
for i=1:n
    L2=[L2,eye(n)];
end
L=[L1;L2];

%Solution
lower_bound=zeros(n*n,1);
upper_bound=ones(n*n,1);
[x_tilde,fval]=linprog(c,[],[],L,ones(2*n,1),lower_bound,upper_bound);