function myui
bg=uibuttongroup('Visible','off','Position',[0 0 .2 1],'SelectionChangedFcn',@bselection);

r1=uicontrol(bg,'Style','radiobutton','String','Option 1','Position',[10 350 100 30],...
    'HandleVisibility','off');

r2=uicontrol(bg,'Style','radiobutton','String','Option 2','Position',[10 250 100 30],...
    'HandleVisibility','off');

r3=uicontrol(bg,'Style','radiobutton','String','Option 3','Position',[10 150 100 30],...
    'HandleVisibility','off');
%Make the uibutton visible after creating child objects
bg.Visible='on';
function bselection(source,callbackdata)
display(['Previous: ' callbackdata.OldValue.String]);
display(['Current : ' callbackdata.NewValue.String]);
display('--------------');
end
end