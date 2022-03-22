
clc ; clear
%% Problem settings
D=8; %dim_of_the_search_space
size_of_the_box=5 ;
m=-size_of_the_box*ones(1,D);      % Lower bound
M=+size_of_the_box*ones(1,D);      % Upper bound

%prob = @f_sphere; %  cost function
% prob = @f_nondiff;
prob = @f_nondiff2;
% prob = @f_nondiff2asym;
% prob = @f_rastrigin;

%% Parameters for DE
N  = floor(10+sqrt(D));	% Population Size (heuristic)
% N = 10*D  ; Luxurious choice
G  = 2000;	% No. of iterations
F  = 0.8;	% Scaling factor
C  = 0.7;	% crossover probability

%% Starting of DE
% Note: (number,dimension,generation)
f     = NaN(N,G);   % collection of Vector to store f(population_g)
P     = NaN(N,D,G); % collection of Matrix to store P(population_g)
V     = NaN(N,D,G); % collection of Matrix to store the mutant vector (V(g+1))
U     = NaN(N,D,G); % collection of Matrix to store the trial solutions (U(g+1))

Pinit = repmat(m,N,1) + repmat((M-m),N,1).*rand(N,D);	% initial P

P(:,:,1)=Pinit;

for n = 1:N
    f(n,1) = prob(P(n,:,1));	% Evaluating f(population_1)
end

%% Iteration loop
tic;

for g=1:(G-1)
    % Step 1 Mutation
    for n=1:N
        to_select=1:D;
        to_select(to_select==n)=[];
   
        size_TS=size(to_select,2);
        r = to_select(randperm(numel(to_select),3));
        
        V(n,:,g+1)=P(r(1),:,g)+F*(P(r(2),:,g)-P(r(3),:,g));
    end
    
    % Step 2 Crossover
    for n=1:N
        I=randi([1,D]);
        for i=1:D
            if rand()<=C | i==I
                U(n,i,g+1)=V(n,i,g+1);
            else
                U(n,i,g+1)=P(n,i,g);
            end
        end
    end
  
    % Step 3 Selection
    for n=1:N
        U(n,:,g+1)=max(m,min(M,U(n,:,g+1)));
        if prob(U(n,:,g+1))<f(n,g)
            P(n,:,g+1)=U(n,:,g+1);
            f(n,g+1)=prob(U(n,:,g+1));
        else
            P(n,:,g+1)=P(n,:,g);
            f(n,g+1)=f(n,g);
        end
    end
    
    if abs(min(min(f)))<0.01
        break
    end
end

calculation_time=toc;

%% Key results at the end of the optimisation
disp('=========== OPTIMAL SOLUTION')
fprintf("calculation time = %gs \n",[calculation_time])
fprintf("The iteration ends at g = %d \n",[g])
[best_value,best_generation]=min(min(f));
[best_value,best_index]=min(f(:,best_generation));
best_solution=V(best_index,:,best_generation);
fprintf("The best solution is given at  %d th generation \n",[best_generation])
fprintf("At index n=%d \n",[best_index])
fprintf("With the value = %g \n",[best_value])
fprintf("At the position = [%s] \n",[num2str(best_solution)])

%% Behavioural analysis

figuren CRITERE
plot(1:G,min(f),'r.',1:G,max(f),'r.',...
    1:G,median(f),'m',1:G,mean(f),'b')
legend('min','max','median','mean')
title('CRITERION')
zoom on ; grid on

d2mean = NaN(N,G); % Table of distances to the average position for each generation
for g=1:G
    for n=1:N
        d2mean(n,g)=norm(P(n,:,g)-mean(P(:,:,g),1));
    end
end

figuren POPULATION_stat2mean
plot(1:G,min(d2mean),'r.',1:G,max(d2mean),'r.',...
    1:G,median(d2mean),'m',1:G,mean(d2mean),'b',...
    1:G,median(d2mean)+std(d2mean),'g',1:G,max(median(d2mean)-std(d2mean),median(d2mean)/100),'g')
legend('min','max','median','mean','median+std','median-std')
title('POPULATION /mean')
zoom on ; grid on

