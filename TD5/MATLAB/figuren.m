function figuren(titre)

%
% figuren(titre)
%
% Crée une figure de nom 'titre'
%
% Si la figure existe déjà elle devient
% figure courante
%

% SF V2021.1

if nargin==0
    hold on;
    zoom on;
    grid on;
    return
end

if  ~(exist('titre')==1)
    return;
end

add=findobj(0,'type','figure');
%l=get(0,'children')' ;

for i=add'
    if strcmp(get(i,'type'),'figure')
        if strcmp(titre,get(i,'name'))
            figure(i);
            return;
        end
    end
end

figure;
set(gcf,'numbertitle','off');
% set(gcf,'menubar','none');
set(gcf,'name',titre);


bbb='----------------------';

%,'callback','actionf(''delete_close_figure'')'

addmenu0=uimenu('label','Fig&Ax');
addmenu0.ForegroundColor=[0 0 1];
uimenu(addmenu0,'label',[bbb,' FIGURE']);
instruction=[	...
    'eval(''hgsave xxyyxxyy ;'');', ...
    'eval(''hgload xxyyxxyy ;'');', ...
    'delete(''xxyyxxyy.fig'');', ...
    'set(gcf,''name'',[''Copie de : '',get(gcf,''name'')])' ];
uimenu(addmenu0,'label','COPY figure','callback',instruction);

addmenu2=uimenu(addmenu0,'label','Memoire');
papa=get(addmenu2,'parent');
papa=papa(1);
instruction=[ ...
    'c=clock;', ...
    'nom=[get(gcf,''name''),sprintf('' (%ih %imn %is)'',c(4),c(5),round(c(6)))];', ...
    'set(gcf,''name'',nom);' ];
set(addmenu2,'CallBack',instruction);

uimenu(addmenu0,'label','Zoom ON','CallBack','zoom on');
uimenu(addmenu0,'label','Zoom OFF','CallBack','zoom off');
uimenu(addmenu0,'label','Zoom OUT','CallBack','zoom out');

uimenu(addmenu0,'label',[bbb,' AXES']);
uimenu(addmenu0,'label','Hold ON','CallBack','hold on');
uimenu(addmenu0,'label','Hold OFF','CallBack','hold off');
uimenu(addmenu0,'label','Grid_x_y','CallBack','grid');
uimenu(addmenu0,'label','Grid_x_on','CallBack','set(gca,"xgrid","on")');
uimenu(addmenu0,'label','Grid_x_off','CallBack','set(gca,"xgrid","off")');
uimenu(addmenu0,'label','Grid_y_on','CallBack','set(gca,"ygrid","on")');
uimenu(addmenu0,'label','Grid_y_off','CallBack','set(gca,"ygrid","off")');

add=uimenu('label','CLOSE ALL');
add.ForegroundColor=[0 0 1];
uimenu(add,'label',' ');
uimenu(add,'label',' ');
uimenu(add,'label',' ');
addclose=uimenu(add,'label','CLOSE ALL FIGURES !!!','CallBack','close all' );
addclose.ForegroundColor=[1 0 0];

add=uimenu('label','FIGURE','CallBack',@listefigure);
add.ForegroundColor=[0 0 1];

    function listefigure(source,callbackdata)
        delete(source.Children)
        add=findobj(0,'type','figure');
        listenum=[];
        listenom=[];
        for i=1:length(add)
            if strcmp(add(i).Type,'figure')
                listenum=[listenum , add(i).Number];
                listenom{i}=add(i).Name;
            end
        end
        [listenum,indx]=sort(listenum);
        for i=listenum
            commande=['figure(',num2str(i),')'];
            addlocal=uimenu(source,...
                'label',[sprintf('%0.2d',i),' : ',listenom{indx(i)}],...
                'CallBack',commande);
            if i==gcf
                addlocal.ForegroundColor=[0 0.5 0.1];
            end
        end
    end

end