clc ; clear

%% Problem settings
D=8; %dim_of_the_search_space
size_of_the_box=5 ;
m=-size_of_the_box*ones(1,D);      % Lower bound
M=+size_of_the_box*ones(1,D);      % Upper bound

prob = @f_nondiff2;

%% Parameters for DE
N  = floor(10+sqrt(D));	% Population Size (heuristic)
%N = 10*D  ; %Luxurious choice
%N=D;
G  = 2000;	% No. of iterations
F  = 0.9;	% Scaling factor
C  = 0.7;	% crossover probability

%% Evaluation
cv_iters=[];
final_std=[];
for trial=1:100
     DE_main
     if abs(min(min(f)))>0.01
        cv_iters=[cv_iters,NaN];
     else
         cv_iters=[cv_iters,g];
     end
     
    d2mean = NaN(N,1); % Table of distances to the average position for each generation
   for n=1:N
       d2mean(n)=norm(P(n,:,g)-mean(P(:,:,g),1));
   end
    final_std=[final_std,std(d2mean)];
end
fprintf("Average convergence iteration %g \n",[mean(cv_iters,'omitnan')]) 
fprintf("Converge probability %g \n",[1-numel(cv_iters(isnan(cv_iters)))/size(cv_iters,2)]) 
fprintf("Average final std %g \n",[mean(final_std)]) 