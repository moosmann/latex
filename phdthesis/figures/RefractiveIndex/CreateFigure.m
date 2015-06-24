function CreateFigure(X,Y,filename,Ylabel,legendLocation,YLimits)

if nargin < 6
    YLimits = 0;
end

%% Parameter
fontSize = 20;
lineWidth = 2;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'YScale','log','YMinorTick','on',...
    'XScale','log','XMinorTick','on','FontSize',20);

% X-limits of the axes
xlim(axes1,[30 30000]);
if YLimits(1) > 0
    ylim(axes1,[YLimits(1) YLimits(2)]);
end

box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to loglog
loglog1 = loglog(X,Y,'Parent',axes1);

%set(loglog1(3),'DisplayName','label');
set(loglog1(1),'DisplayName','iron         ','Color','red','LineWidth',lineWidth);
set(loglog1(2),'DisplayName','calcium','Color','green','LineWidth',lineWidth);
set(loglog1(3),'DisplayName','silicon','Color','yellow','LineWidth',lineWidth);
set(loglog1(4),'DisplayName','carbon','Color','black','LineWidth',lineWidth);
set(loglog1(5),'DisplayName','waterwater','Color','blue','LineWidth',lineWidth);

% Create xlabel
xlabel('Energy','FontSize',fontSize);

% Create ylabel
ylabel(Ylabel,'FontSize',fontSize);

% Create legend
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthWest','Visible','off');

legend1 = legend(axes1,'show');
set(legend1,'Location',legendLocation,'Visible','on','FontSize',20,'Box','off');

% Save figure
saveas(figure1,[filename '.eps'],'psc2')

