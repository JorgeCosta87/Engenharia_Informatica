function clearPgPanel( handles)
%
%Coloca todos os objetos do painel invisíveis

    set(handles.editPgArg1,'String','');
    set(handles.editPgArg2,'String','')
    set(handles.editPgArg3,'String','');
    
    set(handles.textPgTime,'Visible','of');
    set(handles.textPgShowTime,'String','');
    set(handles.tablePGeometrica,'Visible','off');
    set(handles.textPgSoma,'Visible','off');
    set(handles.textPgShowSoma,'String','');

end

