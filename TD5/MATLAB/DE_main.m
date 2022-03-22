
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