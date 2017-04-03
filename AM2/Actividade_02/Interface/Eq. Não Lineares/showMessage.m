%showMessage
%   Apresenta uma messagem de feedback ao utilizador na GUI
%INPUT
%   handles - handles dos objectos da GUI
%   str - mesagem a ser apresentada
%   color - cor da messagem apresentada
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function showMessage(handles,str, color)

    set(handles.textEqFeedback, 'foregroundColor',color);
    set(handles.textEqFeedback,'String',str);
    
end

