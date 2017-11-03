% DerivacaoNumerica Derivação Numérica
% Máquina para calcular soluções aproximadas de derivadas
% --- 12/01/2016  Arménio Correia   armenioc@isec.pt
function varargout = DerivacaoNumerica(varargin)
% DERIVACAONUMERICA M-file for DerivacaoNumerica.fig
%      DERIVACAONUMERICA, by itself, creates a new DERIVACAONUMERICA or raises the existing
%      singleton*.
%
%      H = DERIVACAONUMERICA returns the handle to a new DERIVACAONUMERICA or the handle to
%      the existing singleton*.
%
%      DERIVACAONUMERICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DERIVACAONUMERICA.M with the given input arguments.
%
%      DERIVACAONUMERICA('Property','Value',...) creates a new DERIVACAONUMERICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DerivacaoNumerica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DerivacaoNumerica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DerivacaoNumerica

% Last Modified by GUIDE v2.5 15-Jun-2017 11:40:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DerivacaoNumerica_OpeningFcn, ...
                   'gui_OutputFcn',  @DerivacaoNumerica_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DerivacaoNumerica is made visible.
function DerivacaoNumerica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DerivacaoNumerica (see VARARGIN)

% Choose default command line output for DerivacaoNumerica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DerivacaoNumerica wait for user response (see UIRESUME)
% uiwait(handles.figureDerivacaoNumerica);
MyAtualizar(handles);

%imagem do matlab
axes(handles.axesMatlab)
img = imread('Icons/matlab1.jpg');
image(img)
axis off
axis image

%coloar o axes1 como o eixos de gráficos activos
axes(handles.axes1)

htmlStr = '<html><img width=20 height=20 src="file:Assets/Icons/reset.png" align="left"/> &nbsp;&nbsp&nbsp Reset&nbsp &nbsp</html>';
set(handles.pbReset, 'String',htmlStr);
str = '<html><img width=20 height=20 src="file:Assets/Icons/saveJpeg.png" align="left"/>  &nbsp; Guardar gráfico</html>';
set(handles.btnSaveGraph, 'String',str); 
str = '<html><img width=20 height=20 src="file:Assets/Icons/saveExecl.png" align="left"/> &nbsp; Guardar tabela</html>';
set(handles.btnSaveTable, 'String',str);
str = '<html><img width=20 height=20 src="file:Assets/Icons/refresh.png" align="left"/>  &nbsp;&nbsp&nbsp Actualizar &nbsp &nbsp</html>';
set(handles.pbAtualiza, 'String',str);
 htmlStr = '<html><img width=20 height=20 src="file:Assets/Icons/back.png" align="left"/> &nbsp;&nbsp&nbsp Voltar à interface principal &nbsp &nbsp</html>';
set(handles.btnReturn, 'String',htmlStr);




% --- Outputs from this function are returned to the command line.
function varargout = DerivacaoNumerica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAtualiza.
function pbAtualiza_Callback(hObject, eventdata, handles)
% hObject    handle to pbAtualiza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MyAtualizar(handles);


function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double


% --- Executes during object creation, after setting all properties.
function eA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end 



function eH_Callback(hObject, eventdata, handles)
% hObject    handle to eH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eH as text
%        str2double(get(hObject,'String')) returns contents of eH as a double


% --- Executes during object creation, after setting all properties.
function eH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eB_Callback(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eB as text
%        str2double(get(hObject,'String')) returns contents of eB as a double


% --- Executes during object creation, after setting all properties.
function eB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figureDerivacaoNumerica.
function figureDerivacaoNumerica_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figureDerivacaoNumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);
set(hObject,'Visible','Off');

% --- Função auxiliar associada ao botão Atualizar.
function MyAtualizar(handles)
 
% handles estrutura de dados com as handles para os objetos... 




try
    syms x;
    strF=get(handles.tFuncao,'String');
    f=@(x) eval(vectorize(char(strF)));
    df=diff(f(x));
catch
    if(~isscalar(str2num(strF)))
        set(handles.tFuncao, 'BackgroundColor', [0.86 0.21 0.22]);
        set(handles.tFuncao, 'ForegroundColor', 'white');
        errordlg(['Função inválida'],'Parâmetro Inválido','modal');
        return;
    end
end

set(handles.tFuncao, 'BackgroundColor', 'white');
set(handles.tFuncao, 'ForegroundColor', 'black');


% Obter e validar o inicio do intervalo
a = str2num(get(handles.eA, 'String'));
if ~isscalar(a)
    set(handles.eA, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eA, 'ForegroundColor', 'white');
    errordlg(['Valor de A inválido!'],'Parâmetro Inválido','modal');
    return;
else
    set(handles.eA, 'BackgroundColor', 'white');
    set(handles.eA, 'ForegroundColor', 'black');
end

% Obter e validar o fim do intervalo
b     = str2num(get(handles.eB, 'String'));
if ~isscalar(b)
    set(handles.eB, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eB, 'ForegroundColor', 'white');
    errordlg(['Valor de B inválido!'],'Parâmetro Inválido','modal');
    return;
else
    set(handles.eB, 'BackgroundColor', 'white');
    set(handles.eB, 'ForegroundColor', 'black');
end

% validar que o fim do intervalo é maior que o inicio do intervalo
if b < a
    set(handles.eA, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eA, 'ForegroundColor', 'white');
    set(handles.eB, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eB, 'ForegroundColor', 'white');
    errordlg(['Valor de B têm de ser maior que A!'],'Parâmetro Inválido','modal');
    return;
end

h     = str2num(get(handles.eH, 'String'));
if ~isscalar(h)
    set(handles.eH, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eH, 'ForegroundColor', 'white');
    errordlg(['Valor de H inválido!'],'Parâmetro Inválido','modal');
    return;
else
    set(handles.eH, 'BackgroundColor', 'white');
    set(handles.eH, 'ForegroundColor', 'black');
end



rbEscolhido = find([handles.rbDFP ...
                    handles.rbDFR ...
                    handles.rbDFC ...
                    handles.rbDP3_PTO ... % 3_pto = 3 pontos
                    handles.rbDR3_PTO ... % 3_pto = 3 pontos
                    handles.rb2_derivada
                    ] == get(handles.bgFormulasDNumerica,'SelectedObject' ));
 axes(handles.axes1);
switch(rbEscolhido)
    case 1
        %chamar a função das diferenças progressivas
        [x,y,dydx]=NDerivacaoDFP(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','DerivadaDFP','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));
        
        temp_str1 = strrep(strF, 'x', '(x+1)');
        mFuc = ['( ' temp_str1 ' - ' strF ') / h'];
        
    case 2
        %chamar a função das diferenças regressivas
        [x,y,dydx]=NDerivacaoDFR_2PTO(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','DerivadaDFR','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));
        
        temp_str1 = strrep(strF, 'x', '(x-1)');
        mFuc = ['( ' strF ' - ' temp_str1 ' ) / h']; 
        
    case 3
        %chamar a função das diferenças regressivas
        [x,y,dydx]=NDerivacaoDFC_3PTO(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','DerivadaDFC','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));    
    
        temp_str1 = strrep(strF, 'x', '(x+1)'); 
        temp_str2 = strrep(strF, 'x', '(x-2)');
        
        mFuc = ['( ' temp_str1 ' - ' temp_str2 ' ) / 2*h'];     
         
        
    case 4
        %chamar a função das diferenças regressivas
        [x,y,dydx]=NDerivacaoDFP_3PTO(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','DerivadaDFP 3 pto','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));    
     
        temp_str1 = strrep(strF, 'x', '(x+1)'); 
        temp_str2 = strrep(strF, 'x', '(x+2)');
        
        mFuc = ['( -3*(' strF ') + 4*( ' temp_str1 ') - (' temp_str2 ') ) / 2*h'];     
        
    case 5
        %chamar a função das diferenças regressivas
        [x,y,dydx]=NDerivacaoDFR_3PTO(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','DerivadaDFR 3 pto','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));    
   
        temp_str1 = strrep(strF, 'x', '(x-2)'); 
        temp_str2 = strrep(strF, 'x', '(x-1)');
        
        mFuc = ['( ' temp_str1 ' - 4*( ' temp_str2 ') + 3*(' strF ') ) / 2*h'];
        
    case 6
        %chamar a função das diferenças regressivas
        [x,y,dydx]=NDerivacaoDFP_2_derivada(f,a,b,h); 
        
        dydxExata=eval(df);
       
        erroDFP=abs(dydxExata-dydx);
        
        plot(x,y,'-bo');
        hold on
        plot(x,dydx,'-r+');
        plot(x,dydxExata,'-ks');
        grid on 
        hold off;
       
        legend('Função','2ª Derivada','DExata');
        set(handles.uitabela,'ColumnName',[{'x'},{'y'},{'DNumerica'},{'DExata'},{'Erro'}]);
        set(handles.uitabela,'Data',num2cell([x.',y.',dydx.',dydxExata.',erroDFP.']));    
                  
        temp_str1 = strrep(strF, 'x', '(x+1)'); 
        temp_str2 = strrep(strF, 'x', '(x-1)');
        
        mFuc = ['( ' temp_str1 ' - 2* (' strF ') + *(' temp_str2 ') ) / h^2'];
        
        
end  
 
 
cla(handles.axes2,'reset')
text(0.05, 0.5, ['$' texlabel(mFuc) '$'], 'Parent', handles.axes2, 'interpreter','latex', 'fontsize', 16, 'units','norm');   

set(handles.axes2,'box','on');

set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);
set(handles.axes2,'XTickLabel',[]);  
set(handles.axes2,'YTickLabel',[]); 
%
 
        


% --- Executes on button press in btnSaveGraph.
function btnSaveGraph_Callback(hObject, eventdata, handles)  
[arq,dir] = uiputfile('*.jpg','Guardar Gráfico'); 

if isequal(arq,0) 
    % Caso o utilizador tenha cancelado a interface de diálogo
    return
end

% Criar um frame na zona dos gráficos
%[-40, -45 , 782, 390 ]
F = getframe(handles.axes1, [-50, -40, 843, 415]   );

% Passar o frame para uma imagem
x = frame2im(F);

%Guardar a imagem no ficheiro obtido com o (uiputfile);
imwrite(x,fullfile(dir, arq));


% --- Executes on button press in btnSaveTable.
function btnSaveTable_Callback(hObject, eventdata, handles)
% Obter o caminho para o ficheiro onde irá ficar guardado os dados da
% tabela 
[arq,dir] = uiputfile('*.xls','Guardar Tabela'); 

if isequal(arq,0) 
    % Caso o utilizador tenha cancelado a interface de diálogo
    return
end

% Obter os dados na uiTabela
dados = get(handles.uitabela, 'Data');

% Obter os nomes das colunas 
col_name = get(handles.uitabela, 'ColumnName');

%Vector passado para o excel
tbl = [col_name'; dados];

% Guardar o vectos no excel.
xlswrite(fullfile(dir, arq), tbl);


% --- Executes during object creation, after setting all properties.
function figureDerivacaoNumerica_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figureDerivacaoNumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function btnSair_Callback(hObject, eventdata, handles)
% hObject    handle to btnSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pbReset.
function pbReset_Callback(hObject, eventdata, handles)
% hObject    handle to pbReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
set(handles.rbDFP,'Value', true);

set(handles.eA,'String', '-2*pi');
set(handles.eH,'String', '0.2');
set(handles.eB,'String', '2*pi');

set(handles.axes2_grid,  'Value', true  ); 
set(handles.axes_legend,'Value', false ); 

MyAtualizar(handles);


% --------------------------------------------------------------------
function ssf_Callback(hObject, eventdata, handles)
% hObject    handle to ssf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function showGrid_Callback(hObject, eventdata, handles)
% hObject    handle to showGrid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); 
     grid on;

% --------------------------------------------------------------------
function showLegend_Callback(hObject, eventdata, handles)
% hObject    handle to showLegend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
    xlabel('Eixo dos xx');
    ylabel('Eixo dos yy');

% --------------------------------------------------------------------
function hideGrid_Callback(hObject, eventdata, handles)
% hObject    handle to hideGrid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1); 
     grid off;

% --------------------------------------------------------------------
function hideLegend_Callback(hObject, eventdata, handles)
% hObject    handle to hideLegend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
    xlabel('');
    ylabel('');


% --- Executes on button press in btnReturn.
function btnReturn_Callback(hObject, eventdata, handles)
% hObject    handle to btnReturn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','figureDerivacaoNumerica');
set(h,'Visible','off');  

h = findobj('Tag','mainFig');
set(h,'Visible','on');  



function tFuncao_Callback(hObject, eventdata, handles)
% hObject    handle to tFuncao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tFuncao as text
%        str2double(get(hObject,'String')) returns contents of tFuncao as a double


% --- Executes during object creation, after setting all properties.
function tFuncao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tFuncao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbDFP.
function rbDFP_Callback(hObject, eventdata, handles)
% hObject    handle to rbDFP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDFP
MyAtualizar(handles);


% --- Executes on button press in rbDFR.
function rbDFR_Callback(hObject, eventdata, handles)
% hObject    handle to rbDFR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDFR
MyAtualizar(handles);


% --- Executes on button press in rbDFC.
function rbDFC_Callback(hObject, eventdata, handles)
% hObject    handle to rbDFC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDFC
MyAtualizar(handles);


% --- Executes on button press in rbDP3_PTO.
function rbDP3_PTO_Callback(hObject, eventdata, handles)
% hObject    handle to rbDP3_PTO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDP3_PTO
MyAtualizar(handles);


% --- Executes on button press in rbDR3_PTO.
function rbDR3_PTO_Callback(hObject, eventdata, handles)
% hObject    handle to rbDR3_PTO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbDR3_PTO
MyAtualizar(handles);


% --- Executes on button press in rb2_derivada.
function rb2_derivada_Callback(hObject, eventdata, handles)
% hObject    handle to rb2_derivada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb2_derivada
MyAtualizar(handles);
