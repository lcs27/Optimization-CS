%%
clear all
%we define first the boundaries of the environement
BV=[0 0; 0 5;  10 5; 10 0];
B_A=[   0   -1; 1   0;   0    1;   -1.0000    0.0000];
B_b=[   0  ; 10; 5; 0];

Bpgn=polyshape(BV(:,1),BV(:,2));
plot(Bpgn)

%then provide the initial positions of the agents
c{1}=[1;2.5];c{2}=[4;1];c{3}=[2;1];c{4}=[2;4];c{5}=[8;2.5];

%%
% for each time step t, and for each agent i, we create the polyhedral
% domain V_i(t)
ck=cell(5,20); rk=cell(5,20);
for t=1:20
for i=1:5
    A=[]; b=[]; % TO BE COMPLETED
    for j=1:5
        if j~=i
            A=[]; % TO BE COMPLETED
            b=[]; % TO BE COMPLETED
        end
    end
    V_A{i}=A;
    V_b{i}=b;
end

% create the matrices in view of the LP formulation of the Chebyshev ball
% construction
% 
%                   max f'*x 
%                   s.t.  A_bar * x <= b_bar 
%
for i=1:5
    %  the constraints
    A_bar=[];  % TO BE COMPLETED
    b_bar=[];  % TO BE COMPLETED
    
    % the objective function f'*x
    f=[];  % TO BE COMPLETED
    
    %solve the LP 
    X = linprog(f,A_bar,b_bar)
    
    %extract the optimal values
    xc{i}=X(1:2); % this is the center of the Chebyshev radius
    rc{i}=X(3); %the Chebyshev radius
    

end

for i=1:5
    c{i}=xc{i};
    ck{i,t}=xc{i};
    rk{i,t}= rc{i};
end

end

%plot
figure
hold on
plot(Bpgn);
%%
for i=1:5
ellipplot(eye(2),rk{i,1}^2,'b',ck{i,1})
% hold on
plot(ck{i,1}(1),ck{i,1}(2),'*')
end

for i=1:5
ellipplot(eye(2),rk{i,20}^2,'b',ck{i,20})
% hold on
plot(ck{i,20}(1),ck{i,20}(2),'*')
end

figure
for t=1:20
for i=1:5
ellipplot(eye(2),rk{i,t}^2,'b',ck{i,t})
 hold on
plot(ck{i,t}(1),ck{i,t}(2),'*')
end
hold off
pause(0.1)
end