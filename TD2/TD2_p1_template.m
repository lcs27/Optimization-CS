%% initialization data
clear all
close all
clc

%% 
%%P
%PV=[0 0; 0 1; 1.66 1; 0.33 0]; % Pv are the vertices of the polyhedron P
%A=[0 -1; -1 0 ;  3  -4; 0 1;]
%b=[ 0; 0 ; 1; 1];


%pgn=polyshape(PV(:,1),PV(:,2));

 % P_1
%PV=[0 0; 0 0.8; 0.2 1; 1.5 1; 0.5 0];
%A=[0 -1; -1 0 ;  4  -4; 0 1;-0.5 0.5]
%b=[ 0; 0 ; 2; 1; 0.4];

 %pgn=polyshape(PV(:,1),PV(:,2));


% % P_2
 %PV=[0 0; 0.33 0];
 %A=[0 -1; -1 0 ;  3  -4]
 %b=[ 0; 0 ; 1];
% 
%pgn=polyshape(PV(:,1),PV(:,2));
plot(pgn);

%%
% normalize the half space representation in such a way that each
% constraint has a norm =1. 

%for i=1:size(A,1)
%    b(i,1)=b(i)/norm(A(i,:));
%    A(i,:)=A(i,:)/norm(A(i,:));
%end


%%
% create the matrices in view of the LP formulation of the Chebyshev ball
% construction
% 
%                   max [c*x] 
%                   s.t.  A_bar *x = b_bar 
%
a_tilde = vecnorm(A,2,2);
A_bar=[A,a_tilde,eye(size(A,1));1 -1 zeros(1,size(A,1)+1)]
b_bar=[b;0]

% % the objective
c=[0 0 +1 zeros(1,size(A,1))];

%%

% use the procedure simplexe.m 
% "help simplexe" for more details

[~,~,~,X,~]=simplexe(A_bar,b_bar,c);


xc=X(1:2); % this is the center of the Chebyshev radius
r=X(3); %the Chebyshev radius


%%
% plot the result
plot(xc(1),xc(2),'*') 
hold on
plot(pgn)
for i=1:size(A,1)
    plot(xc(1)+r*A(i,1),xc(2)+r*A(i,2),'*')
end

ellipplot(eye(2),r^2,'b',xc')
plot(-1:6,-1:6,'k--')
plot(pgn);

%%


