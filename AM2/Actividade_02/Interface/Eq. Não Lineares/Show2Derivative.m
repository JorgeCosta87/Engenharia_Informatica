%setUserinteraction
%   Calcula a 2º derivada e apresenta-a no gráfico
%
%INPUT
%   handles - handles dos objectos da GUI
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 


function Show2Derivative(handles)
    
    f = FRvr(get(handles.editF,'String'));
    a = str2num(get(handles.editA,'String'));
    b = str2num(get(handles.editB,'String'));
    df   = diff(f(sym('x')),2);
    df_dx = @(x) eval(vectorize(char(df)));
    
    fplot(df_dx,[a b],'r');
    hLegend = legend('f (x)','f ''''(x)');
    set(hLegend,'FontSize',14);
end

