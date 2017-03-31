function  clearText( handles )
    
  %set(handles.editF,'String','');
  set(handles.editA,'Visible','off');
  set(handles.editA,'String','');
  set(handles.textEqA,'Visible','off');
  set(handles.editB,'Visible','off');
  set(handles.editB,'String','');
  set(handles.textEqB,'Visible','off');
  set(handles.editEqKmax,'Visible','off');
  set(handles.textEqKmax,'Visible','off');
  set(handles.editEqKmax,'String','');
  set(handles.editEqTol,'Visible','off');
  set(handles.textEqTol,'Visible','off');
  set(handles.editEqTol,'String','');
  set(handles.btnEqGerar,'Enable','off');
  set(handles.textEqShowAprox,'String','0');
  set(handles.textEqFeedback,'String','');
  set(handles.textEqX0,'Visible','off');
  set(handles.editEqX0,'Visible','off');
  set(handles.textEqX1,'Visible','off');
  set(handles.editEqX1,'Visible','off');
  set(handles.tableEq, 'Data', cell(size(get(handles.tableEq,'Data'))));
end

