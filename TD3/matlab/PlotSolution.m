function TracerSolution(NumerosCasiers, PositionObjets, PositionCasiers)

% fontion permettant une repr�sentation graphique d'une solution
% du probl�me de rangement
% INPUT : 
%   - NumerosCasiers   : vecteur indiquant le casier affect� pour chaque
%                        objet (NumerosCasier(j)=i indique l'objet n�j est dans la boite n�i.
%   - PositionsObjets  : vecteur de m�me taille que NumerosCasiers indiquant
%                        la position initiale de chaque objet. Les positions des objets sont
%                        rep�r�es dans le plan (x,y) par des nombres � valeurs complexes.
%   - PositionsCasiers : vecteur de m�me taille que NumerosCasiers indiquant
%                        la position de chaque boite. Les positions des boites sont
%                        rep�r�es dans le plan (x,y) par des nombres � valeurs complexes.

n=length(NumerosCasiers);   % nombre d'objets
figure, hold on

hc=plot(real(PositionCasiers),imag(PositionCasiers),'s','markersize',10); % trac�s des casiers
for j=1:n  %  num�ros des casiers
    text(real(PositionCasiers(j)-1/(2*(n-1))),imag(PositionCasiers(j)),int2str(j),'fontsize',5)
end
for i=1:n  % trac� des objets et de leurs num�ros
    ho=plot(real(PositionObjets(i)),imag(PositionObjets(i)),'ro');
    text(real(PositionObjets(i)),imag(PositionObjets(i)),['n� ',int2str(i)])
end
axis equal
for i=1:n, % trac� d'un segment entre chaque objet et le casier qui lui a �t� affect�
    hsol=plot([real(PositionObjets(i)) real(PositionCasiers(NumerosCasiers(i)))] , [imag(PositionObjets(i)) imag(PositionCasiers(NumerosCasiers(i)))],'g');
end
legend([ho,hc,hsol],'objet','casier','affectation')