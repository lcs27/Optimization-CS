% Course6 Exo3
% Resolution of Integer Linear Programming by branch and bound algorithme
% This code is provided by Chensheng Luo, a P2023 student of CentraleSupélec; the support code:
% - simplexe 
% - phasei
% - phaseii
%is proposed by our teacher.
clear
%% Context of question
% Solve a ILP question: 
% max px=15x1+15x2+14x3+13x4 with x1,x2,x3,x4 in {0,1}
% s.t. 3x1+6x2+8x3+7x4<=12
q=[3;6;8;7];
p=[15;25;14;13];
Q=12;

%% Initialization
disp('n=  0');
A=[q',1,0,0,0,0;
    1,0,0,0,0,1,0,0,0;
    0,1,0,0,0,0,1,0,0;
    0,0,1,0,0,0,0,1,0;
    0,0,0,1,0,0,0,0,1];
b=[Q;1;1;1;1];
c=[p',0,0,0,0,0];
[mu,~,~,xbasic,ibasic]=simplexe(A,b,c);
x=get_exo3_solution(xbasic,ibasic);

fprintf('\t The LP give result at mu='),disp(mu),fprintf('%c%c', 8, 8),fprintf(' at'),disp(x);

%The list of LP result
mus=[mu;];
xs{1}=x;
As{1}=A;
bs{1}=b;
cs{1}=c;
if sum(size(x))~=0
        if (q')*round(x')<=Q
            minor=(p')*round(x');
             fprintf('\t Minor bound is now'),disp(minor),fprintf('%c%c', 8, 8),fprintf('   got at'),disp(round(x));
        else
            minor=inf;
            fprintf('\t Nearby integer value is unfeasible, minor bound is now'),disp(minor);
        end
       
end
%% Iteration
n=1;
while 1
    fprintf('n='),disp(n);
    [~,l]=max(mus);% Find the part to be branched
    x=xs{l};
    A=As{l};
    b=bs{l};
    c=cs{l};
    [~,i]=max(abs(x-round(x)));%Find the part to split
    fprintf('\t Split to two part: \t x'),disp(i),fprintf('%c%c', 8, 8),fprintf('<='),disp(floor(x(i))),fprintf('%c%c', 8, 8);
   fprintf('and x'),disp(i),fprintf('%c%c', 8, 8),fprintf('>='),disp(ceil(x(i)));
    
   [sm,sn]=size(A);
    toinsert=zeros(1,sn);
    toinsert(i)=1;
    A1=[A,zeros(sm,1);toinsert,1];
    b1=[b;floor(x(i))];
    c1=[c,0];
    
    A2=[A,zeros(sm,1);toinsert,-1];
    b2=[b;ceil(x(i))];
    c2=[c,0];
    
    %% Solution
    [mu1,~,~,xbasic,ibasic]=simplexe(A1,b1,c1);
    if mu1<inf
        x1=get_exo3_solution(xbasic,ibasic);
        fprintf('\t\t For the first part, the LP give result at mu='),disp(mu1),fprintf('%c%c', 8, 8),fprintf(' at'),disp(x1);
    else
        x1=[];% Unfeasible
        fprintf('\t\t For the first part, unfeasible!\n');
    end
    if mu1<minor
        mu1=inf;% Discarded
        x1=[];
         fprintf('\t\t\t Discarded as smaller than minor bound'),disp(minor);
    end
    %Update bound
    if sum(size(x1))~=0
        if (q')*round(x1')<=Q
            if (p')*round(x1')>minor
                minor=(p')*round(x1');
                fprintf('\t\t\t Minor bound updated to'),disp(minor),fprintf('%c%c', 8, 8),fprintf('   got at'),disp(round(x1));
            end
        end
    end

    
    [mu2,~,~,xbasic,ibasic]=simplexe(A2,b2,c2);
     if mu2<inf
        x2=get_exo3_solution(xbasic,ibasic);
        fprintf('\t\t For the second part, the LP give result at mu='),disp(mu2),fprintf('%c%c', 8, 8),fprintf(' at'),disp(x2);
    else
        x2=[];% Unfeasible
        fprintf('\t\t For the second part, unfeasible!\n');
     end
     
     if mu2<minor
        mu2=inf;% Discarded
        x2=[];
         fprintf('\t\t\t Discarded as smaller than minor bound'),disp(minor);
     end
    %Update bound
    if sum(size(x2))~=0
        if (q')*round(x2')<=Q
            if (p')*round(x2')>minor
                minor=(p')*round(x2');
                fprintf('\t\t\t Minor bound updated to'),disp(minor),fprintf('%c%c', 8, 8),fprintf('   got at'),disp(round(x2));
            end
        end
    end
    
    %% Judge
    
    
    mus(l)=mu1;
    xs{l}=x1;
    As{l}=A1;
    bs{l}=b1;
    cs{l}=c1;
    
    mus(end+1)=mu2;
    xs{end+1}=x2;
    As{end+1}=A2;
    bs{end+1}=b2;
    cs{end+1}=c2;
    fprintf('\t\t Now we have mu='),disp(mus);
    
    if and(sum(x1~=round(x1))==0,sum(size(x1))~=0)
        ANSWER=mu1;
        X=x1;
        break;
    end
    if and(sum(x2~=round(x2))==0,sum(size(x2))~=0)
        ANSWER=mu2;
        X=x2;
        break;
    end
    
    if min(mus)==inf
        fprintf('Unfeasible!'),disp(mus);
        break;
    end
    n=n+1;
    end
fprintf('Now we have final result:')
disp(ANSWER),fprintf('%c%c', 8, 8),fprintf(' at x='),
disp(X) 
clearvars -except X ANSWER