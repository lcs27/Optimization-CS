function [zmax,PHIiter,PHIIiter,xbasic,ibasic]=simplexe(A,b,c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  fonction         Simplexe(A,b,c)
%
% Cette routine permet de r¨¦soudre le probl¨¨me
%
%      max (cx) sous la contrainte Ax = b , avec b >= 0
%
% par l'algorithme du simplexe.
% En sortie, elle retourne :
% zmax : la valeur du profit ¨¤ l'optimum.
% PHIiter : le nombre d'it¨¦ration dans la phase I.
% PHIIiter : le nombre d'it¨¦ration dans la phase II.
% xbasic : Les valeurs des variables de base ¨¤ l'optimum.
% ibasic : les indices des variables de base ¨¤ l'optimum.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Cette routine est le clone de 'linprog', d¨¦velopp¨¦ par 
% Jeff Stuart
% Department of Mathematics,
% University of Southern Mississippi, Hattiesburg, MS 39406.
% December, 1993.  Revised, October, 1997.
% jeffrey.stuart@usm.edu


[m,n]=size(A);
if max(size(b) ~=[m 1]);
   disp('The dimensions of b do not match the dimensions of A.')
   return
end   
if min(b) < 0;
   disp('The RHS vector b must be nonnegative.')
   return
end   
if max(size(c) ~=[1 n]);
   disp('The dimensions of c do not match the dimensions of A.')
   return
end
if rank(A) ~=m;
   disp('A does not have full row rank.')
   return
end
% f=flops;
t=cputime;
PHIiter=0;
PHIIiter=0;
tol=0.0000000001;
xbasic=zeros(1,n);
[wmax,ibasic,PHIiter]=phasei(A,b);
if wmax < -tol ;
%      f=flops -f;     
     t=cputime -t;
%      disp('The total flops required was: '),disp(f)
%      disp('The required cpu time was: '),disp(t)
    zmax=inf;
    xbasic=0;
    ibasic=0;
else;
     [zmax,xbasic,ibasic,ienter,PHIIiter,PCOL,OPTEST,CYCTEST]=phaseii(A,b,c,ibasic);
     xbasic=xbasic';
%      f=flops - f;
     t=cputime -t ;
     if CYCTEST==1;
        return
     end
end
        