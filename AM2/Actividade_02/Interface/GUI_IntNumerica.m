function varargout = GUI_IntNumerica(varargin)
% GUI_INTNUMERICA MATLAB code for GUI_IntNumerica.fig
%      GUI_INTNUMERICA, by itself, creates a new GUI_INTNUMERICA or raises the existing
%      singleton*.
%
%      H = GUI_INTNUMERICA returns the handle to a new GUI_INTNUMERICA or the handle to
%      the existing singleton*.
%
%      GUI_INTNUMERICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_INTNUMERICA.M with the given input arguments.
%
%      GUI_INTNUMERICA('Property','Value',...) creates a new GUI_INTNUMERICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_IntNumerica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_IntNumerica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_IntNumerica

% Last Modified by GUIDE v2.5 14-Jun-2017 22:20:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_IntNumerica_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_IntNumerica_OutputFcn, ...
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


% --- Executes just before GUI_IntNumerica is made visible.
function GUI_IntNumerica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_IntNumerica (see VARARGIN)

% Choose default command line output for GUI_IntNumerica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_IntNumerica wait for user response (see UIRESUME)
% uiwait(handles.figure1);
Actualiza(handles); 

axes(handles.axesMatlab)
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
str = '<html><img width=20 height=20 src="file:Assets/Icons/refresh.png" align="left"/>  &nbsp;&nbsp Actualizar  &nbsp</html>';
set(handles.pbAtualizar, 'String',str);
 htmlStr = '<html><img width=20 height=20 src="file:Assets/Icons/back.png" align="left"/> &nbsp;&nbsp&nbsp Voltar à interface principal &nbsp &nbsp</html>';
set(handles.btnReturn, 'String',htmlStr);

set(handles.axes2,'box','on');

set(handles.axes2,'xtick',[]);
set(handles.axes2,'ytick',[]);
set(handles.axes2,'XTickLabel',[]);  
set(handles.axes2,'YTickLabel',[]); 

    
    
% --- Outputs from this function are returned to the command line.
function varargout = GUI_IntNumerica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAtualizar.
function pbAtualizar_Callback(hObject, eventdata, handles)
% hObject    handle to pbAtualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Actualiza(handles);


function eF_Callback(hObject, eventdata, handles)
% hObject    handle to eF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eF as text
%        str2double(get(hObject,'String')) returns contents of eF as a double


% --- Executes during object creation, after setting all properties.
function eF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function eN_Callback(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eN as text
%        str2double(get(hObject,'String')) returns contents of eN as a double


% --- Executes during object creation, after setting all properties.
function eN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rbTrapezios.
function rbTrapezios_Callback(hObject, eventdata, handles)
% hObject    handle to rbTrapezios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Actualiza(handles);
disp('hey')


% --- Executes on button press in rbSimpson.
function rbSimpson_Callback(hObject, eventdata, handles)
% hObject    handle to rbSimpson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Actualiza(handles);


% --- Executes on button press in rbQuad.
function rbQuad_Callback(hObject, eventdata, handles)
% hObject    handle to rbQuad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Actualiza(handles);

% --- Executes on button press in rbTodos.
function rbTodos_Callback(hObject, eventdata, handles)
% hObject    handle to rbTodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Actualiza(handles)

function Actualiza(handles)
% handles    structure with handles and user data (see GUIDATA)
 axes(handles.axes1);
% Obter uma função do tipo f(x) válida
strF  =  get(handles.eF,'String');
f     =  @(x) eval(vectorize(strF));

try
    testeF = f(sym('x'));
catch
    % Caso a função não seja válida
    set(handles.eF, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eF, 'ForegroundColor', 'white');
    errordlg(['Introduza uma função do tipo f(x)!'],'Função Inválida','modal');
    return;
end

% Caso a função seja válida voltamos às propriedades originais
set(handles.eF, 'BackgroundColor', 'white');
set(handles.eF, 'ForegroundColor', 'black');

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

n     = str2num(get(handles.eN, 'String'));
if ~isscalar(n)
    set(handles.eN, 'BackgroundColor', [0.86 0.21 0.22]);
    set(handles.eN, 'ForegroundColor', 'white');
    errordlg(['Valor de B inválido!'],'Parâmetro Inválido','modal');
    return;
else
    set(handles.eN, 'BackgroundColor', 'white');
    set(handles.eN, 'ForegroundColor', 'black');
end

h=(b-a)/n;

escolha = find([handles.rbTrapezios ...
                handles.rbSimpson ...
                handles.rbQuad ...
                handles.rbTodos] == get(handles.bSelect,'SelectedObject'));
            
TRAPEZIOS = 1;
SIMPSON = 2;
QUAD   = 3;
TODOS   = 4;

try
    yTrapezios = RTrapezios(f,a,b,n);
    ySimpson = RSimpson(f,a,b,n);
    yQuad = quad(f,a,b);
    
    yExacta = integral(f,a,b); % calcular solução exata
    %yExacta = eval(vectorize(char(sExacta)));
    
    fplot(f, [a b], 'b'); % f(x) de a até b 
    hold on
    
    % Grid
    if (get(handles.cbGrid,'Value'))
        grid on
    end
        
    % Fill
    if (get(handles.cbFill,'Value'))
       	%fill([0:4], yExacta,  'c'); %%% <------------------- ?????????????
        g = [a:1/30:b];
        t = f(g);
       area(g, t);
    %   fill(g, t,  'c'); 
    end
    
    % Legenda
    if (get(handles.cbLegenda,'Value'))
        legend('f(x)');
    end
    
    % Legenda Eixos
    if (get(handles.cbLegendaEixos,'Value'))
        xlabel('Eixo dos xx');
        ylabel('Eixo dos yy');
    end
    
    hold off
    switch(escolha)
        case TRAPEZIOS          
            set(handles.uiTabela,'ColumnName',[{'Solução Exacta'},...
                {'Trapézios'},{'Erro Trapézios'}])
            
            % plot(yTrapezios, [a b], 'b'); % f(x) de a até b
             
            cTabela = [yExacta.', yTrapezios.',abs(yTrapezios-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case SIMPSON   
            if(mod(n,2) ~= 0)
                msgbox('Na regra de simpson o número de subintervalos tem de ser PAR' , 'Número PAR')
            else
                set(handles.uiTabela,'ColumnName',[{'Solução Exacta'},...
                    {'Simpson'},{'Erro Simpson'}])

                cTabela = [yExacta.', ySimpson.',abs(ySimpson-yExacta).'];
                set(handles.uiTabela,'Data',num2cell(cTabela))
            end
        case QUAD          
            set(handles.uiTabela,'ColumnName',[{'Solução Exacta'},...
                {'Quad'},{'Erro Quad'}])
            
            cTabela = [yExacta.', yQuad.',abs(yQuad-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case TODOS
			if(mod(n,2) ~= 0) % Na regra de simpson o número de subintervalos tem de ser PAR
				set(handles.uiTabela,'ColumnName',[{'Solução Exacta'},...
					{'Trapézios'},{'Quad'},...
					{'Erro Trapézios'},{'Erro Quad'}])
				
				cTabela = [yExacta.', yTrapezios.',yQuad.',...
					abs(yTrapezios-yExacta).',abs(yQuad-yExacta).'];
				set(handles.uiTabela,'Data',num2cell(cTabela))
			else
				set(handles.uiTabela,'ColumnName',[{'Solução Exacta'},...
					{'Trapézios'},{'Simpson'},{'Quad'},...
					{'Erro Trapézios'},{'Erro Simpson'},{'Erro Quad'}])
				
				cTabela = [yExacta.', yTrapezios.',ySimpson.',yQuad.',...
					abs(yTrapezios-yExacta).',abs(ySimpson-yExacta).',abs(yQuad-yExacta).'];
				set(handles.uiTabela,'Data',num2cell(cTabela))

			end
    end
     
       

        cla(handles.axes2,'reset')
        text(0.05, 0.5, ['$\int_{' num2str(a) '}^{' num2str(b)  '} ' texlabel(strF) ' dx = ' num2str(yExacta) '$'], 'Parent', handles.axes2, 'interpreter','latex', 'fontsize', 20, 'units','norm'); 
         set(handles.axes2,'box','on');

        set(handles.axes2,'xtick',[]);
        set(handles.axes2,'ytick',[]);
        set(handles.axes2,'XTickLabel',[]);  
        set(handles.axes2,'YTickLabel',[]); 
catch Me
     errordlg(['Ocorreu um Erro: ' Me.message],'Erro','modal');
end


% --- Executes on button press in cbGrid.
function cbGrid_Callback(hObject, eventdata, handles)
% hObject    handle to cbGrid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Actualiza(handles);


% --- Executes on button press in cbFill.
function cbFill_Callback(hObject, eventdata, handles)
% hObject    handle to cbFill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Actualiza(handles);


% --- Executes on button press in cbLegenda.
function cbLegenda_Callback(hObject, eventdata, handles)
% hObject    handle to cbLegenda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Actualiza(handles);


% --- Executes on button press in cbLegendaEixos.
function cbLegendaEixos_Callback(hObject, eventdata, handles)
% hObject    handle to cbLegendaEixos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Actualiza(handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
set(hObject,'Visible','Off'); % não fechar...

 
% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function  figure1_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not c
% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pbReset.
function pbReset_Callback(hObject, eventdata, handles)
% hObject    handle to pbReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.cbGrid,'Value', false);
set(handles.cbFill,'Value', false);
set(handles.cbLegenda,'Value', false);
set(handles.cbLegendaEixos,'Value', false);

set(handles.rbTrapezios,'Value', true); 

set(handles.eA,'String', '1');  
set(handles.eB,'String', '5'); 
set(handles.eN,'String', '1'); 
set(handles.eF,'String', 'x^2');  
Actualiza(handles); 


% --- Executes on button press in btnSaveTable.
function btnSaveTable_Callback(hObject, eventdata, handles)
% hObject    handle to btnSaveTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[arq,dir] = uiputfile('*.xls','Guardar Tabela'); 

if isequal(arq,0) 
    % Caso o utilizador tenha cancelado a interface de diálogo
    return
end

% Obter os dados na uiTabela
dados = get(handles.uiTabela, 'Data');

% Obter os nomes das colunas 
col_name = get(handles.uiTabela, 'ColumnName');

%Vector passado para o excel
tbl = [col_name'; dados];

% Guardar o vectos no excel.
xlswrite(fullfile(dir, arq), tbl);

% --- Executes on button press in btnSaveGraph.
function btnSaveGraph_Callback(hObject, eventdata, handles)
% hObject    handle to btnSaveGraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[arq,dir] = uiputfile('*.jpg','Guardar Gráfico'); 

if isequal(arq,0) 
    % Caso o utilizador tenha cancelado a interface de diálogo
    return
end

% Criar um frame na zona dos gráficos
%[-40, -45 , 782, 390 ]
F = getframe(handles.axes1, [-25, -20, 760, 265]   );

% Passar o frame para uma imagem
x = frame2im(F);

%Guardar a imagem no ficheiro obtido com o (uiputfile);
imwrite(x,fullfile(dir, arq));

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btnSair_Callback(hObject, eventdata, handles)
% hObject    handle to btnSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes on button press in btnReturn.
function btnReturn_Callback(hObject, eventdata, handles)
% hObject    handle to btnReturn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','figure1');
set(h,'Visible','off');  

h = findobj('Tag','mainFig');
set(h,'Visible','on');  


% --- Executes when bSelect is resized.
function bSelect_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to bSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function bSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes when selected object is changed in bSelect.
function bSelect_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bSelect 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

