function TracerSolution(NumerosCasiers, PositionObjets, PositionCasiers)

% fontion permettant une représentation graphique d'une solution
% du problème de rangement
% INPUT : 
%   - NumerosCasiers   : vecteur indiquant le casier affecté pour chaque
%                        objet (NumerosCasier(j)=i indique l'objet n°j est dans la boite n°i.
%   - PositionsObjets  : vecteur de même taille que NumerosCasiers indiquant
%                        la position initiale de chaque objet. Les positions des objets sont
%                        repérées dans le plan (x,y) par des nombres à valeurs complexes.
%   - PositionsCasiers : vecteur de même taille que NumerosCasiers indiquant
%                        la position de chaque boite. Les positions des boites sont
%                        repérées dans le plan (x,y) par des nombres à valeurs complexes.

n=length(NumerosCasiers);   % nombre d'objets
figure, hold on

hc=plot(real(PositionCasiers),imag(PositionCasiers),'s','markersize',10); % tracés des casiers
for j=1:n  %  numéros des casiers
    text(real(PositionCasiers(j)-1/(2*(n-1))),imag(PositionCasiers(j)),int2str(j),'fontsize',5)
end
for i=1:n  % tracé des objets et de leurs numéros
    ho=plot(real(PositionObjets(i)),imag(PositionObjets(i)),'ro');
    text(real(PositionObjets(i)),imag(PositionObjets(i)),['n° ',int2str(i)])
end
axis equal
for i=1:n, % tracé d'un segment entre chaque objet et le casier qui lui a été affecté
    hsol=plot([real(PositionObjets(i)) real(PositionCasiers(NumerosCasiers(i)))] , [imag(PositionObjets(i)) imag(PositionCasiers(NumerosCasiers(i)))],'g');
end
legend([ho,hc,hsol],'objet','casier','affectation')