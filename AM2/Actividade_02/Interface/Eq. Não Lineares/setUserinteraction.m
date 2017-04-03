%setUserinteraction
%   Função responsável por bloquear a interação utilizador com a GUI
%   no decorrer das animações
%INPUT
%   handles - handles dos objectos da GUI
%   bool(true/false) - bloquear ou desbloquear os elementos da GUI
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 


function setUserinteraction(handles, bool )
    
    if(bool == false)
        set(handles.editF,'Enable','off');
        set(handles.editA,'Enable','off');
        set(handles.editB,'Enable','off');
        set(handles.editEqX0,'Enable','off');
        set(handles.editEqX1,'Enable','off');
        set(handles.editEqKmax,'Enable','off');
        set(handles.editEqTol,'Enable','off');
        set(handles.radioEqAnim ,'Enable', 'off');
        set(handles.radioEqStep ,'Enable', 'off');
        set(handles.radioEqNone ,'Enable', 'off');
        set(handles.radioBi,'Enable','off');
        set(handles.radioTg,'Enable','off');
        set(handles.radioPf,'Enable','off');
        set(handles.radioFp,'Enable','off');
        set(handles.radioSe,'Enable','off');
        set(handles.btnEqGerar ,'Enable', 'off');
        set(handles.btnEqBack ,'Enable', 'off');
    else
        set(handles.editF,'Enable','on');
        set(handles.editA,'Enable','on');
        set(handles.editB,'Enable','on');
        set(handles.editEqX0,'Enable','on');
        set(handles.editEqX1,'Enable','on');
        set(handles.editEqKmax,'Enable','on');
        set(handles.editEqTol,'Enable','on');
        set(handles.radioEqAnim ,'Enable', 'on');
        set(handles.radioEqStep ,'Enable', 'on');
        set(handles.radioEqNone ,'Enable', 'on');
        set(handles.radioBi,'Enable','on');
        set(handles.radioTg,'Enable','on');
        set(handles.radioPf,'Enable','off');
        set(handles.radioFp,'Enable','on');
        set(handles.radioSe,'Enable','on');
        set(handles.btnEqGerar ,'Enable', 'on');
        set(handles.btnEqBack ,'Enable', 'on');
    end
end

