function clearPaPanel( handles)
%
%Coloca todos os objetos do painel invisíveis

    set(handles.editPaArg1,'String','');
    set(handles.editPaArg2,'String','')
    set(handles.editPaArg3,'String','');
    
    set(handles.textPaTime,'Visible','of');
    set(handles.textPaShowTime,'String','');
    set(handles.tablePAritmetica,'Visible','off');
    set(handles.textPaSoma,'Visible','off');
    set(handles.textPaShowSoma,'String','');

end

