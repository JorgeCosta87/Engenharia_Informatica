function varargout = AM2(varargin)
% AM2 MATLAB code for AM2.fig
%      AM2, by itself, creates a new AM2 or raises the existing
%      singleton*.
%
%      H = AM2 returns the handle to a new AM2 or the handle to
%      the existing singleton*.
%
%      AM2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AM2.M with the given input arguments.
%
%      AM2('Property','Value',...) creates a new AM2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AM2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AM2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AM2

% Last Modified by GUIDE v2.5 12-Jun-2017 03:29:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AM2_OpeningFcn, ...
                   'gui_OutputFcn',  @AM2_OutputFcn, ...
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


% --- Executes just before AM2 is made visible.
function AM2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AM2 (see VARARGIN)

% Choose default command line output for AM2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


%comunication between guis
                             
hSolucao.filhas(1)= MaquinaDerivadaPrimitiva('Visible','off');  
hSolucao.filhas(2)= DerivacaoNumerica('Visible','Off'); 
hSolucao.filhas(3)= GUI_IntNumerica('Visible','Off');  



axes(handles.axesPg)
imgPg = imread('Assets/pg.jpg');
image(imgPg)
axis off
axis image

axes(handles.axesNumeric)
imgNumeric = imread('Assets/numeric.jpg');
image(imgNumeric)
axis off
axis image


%Docente

axes(handles.axesDocente)
imgDocente = imread('photos/armenio.jpg');
image(imgDocente)
axis off
axis image

%imagens dos autores

axes(handles.axesJorge)
imgJorge = imread('photos/jorge.jpg');
image(imgJorge)
axis off
axis image

%icon faceBook
str = '<html><img width=31 height=35 src="file:Assets/Icons/face2.png" align="center"/> </html>';
set(handles.btnFaceDocente, 'String',str);  
str = '<html><img width=31 height=35 src="file:Assets/Icons/face2.png" align="center"/> </html>';
set(handles.btnFaceJorge, 'String',str); 


% Icon email
str = '<html><img width=20 height=20 src="file:Assets/Icons/email.png" align="left"/>  &nbsp; Enviar email</html>';
set(handles.btnEmailDocente, 'String',str);  
str = '<html><img width=20 height=20 src="file:Assets/Icons/email.png" align="left"/>  &nbsp; Enviar email</html>';
set(handles.btnEmailJorge, 'String',str);  


%icon do bot�o de enviar email
str = '<html><img width=20 height=20 src="file:Assets/Icons/send1.png" align="left"/>  &nbsp; Enviar</html>';
set(handles.bntSend, 'String',str);  



% UIWAIT makes AM2 wait for user response (see UIRESUME)
% uiwait(handles.mainFig);


% --- Outputs from this function are returned to the command line.
function varargout = AM2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function mainFig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mainFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %Define o tamanho da figure
    boxSize = [1248 745];
    
    %Obt�m a dimens�o do ecr�
    screensize = get(0,'ScreenSize');
    xPos = ceil(screensize(3) / 2) - (boxSize(1)/2);
    yPos = ceil(screensize(4) / 2) - (boxSize(2)/2);
    set(hObject,'Units','pixels');
    set(hObject,'Position',[xPos, yPos, boxSize(1), boxSize(2)]);
         
    %set(hObject,'Units','Pixels','Position',get(0,'ScreenSize'))


% --- Executes on button press in btnPg.
function btnPg_Callback(hObject, eventdata, handles)
% hObject    handle to btnPg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.mainPg,'Visible','on');
    set(handles.textPg,'Visible','on');

% --- Executes on button press in btnEq.
function btnEq_Callback(hObject, eventdata, handles)
% hObject    handle to btnEq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelEq,'Visible','on');


% --- Executes on button press in btnPgAritmetica.
function btnPgAritmetica_Callback(hObject, eventdata, handles)
% hObject    handle to btnPgAritmetica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.panelPgGeometrica,'Visible','off');
    set(handles.panelPgAritmetica,'Visible','on');
    clearPaPanel(handles);

% --- Executes on button press in btnGerarPg.
function btnPgGeometrica_Callback(hObject, eventdata, handles)
% hObject    handle to btnGerarPg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.panelPgAritmetica,'Visible','off');
    set(handles.panelPgGeometrica,'Visible','on');
    clearPgPanel(handles);



% --- Executes on button press in btnPgBack.
function btnPgBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnPgBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.textPg,'Visible','off');
    set(handles.panelPgAritmetica,'Visible','off');
    set(handles.panelPgGeometrica,'Visible','off');
    set(handles.mainPg,'Visible','off');
    clearPgPanel(handles);
    clearPaPanel(handles);


function editPaArg1_Callback(hObject, eventdata, handles)
% hObject    handle to editPaArg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPaArg1 as text
%        str2double(get(hObject,'String')) returns contents of editPaArg1 as a double


% --- Executes during object creation, after setting all properties.
function editPaArg1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPaArg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPaArg2_Callback(hObject, eventdata, handles)
% hObject    handle to editPaArg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPaArg2 as text
%        str2double(get(hObject,'String')) returns contents of editPaArg2 as a double


% --- Executes during object creation, after setting all properties.
function editPaArg2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPaArg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPaArg3_Callback(hObject, eventdata, handles)
% hObject    handle to editPaArg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPaArg3 as text
%        str2double(get(hObject,'String')) returns contents of editPaArg3 as a double


% --- Executes during object creation, after setting all properties.
function editPaArg3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPaArg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGerarPa.
function btnGerarPa_Callback(hObject, eventdata, handles)
% hObject    handle to btnGerarPa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    GerarPA(handles);
    
   
% --- Executes on button press in btnGerarPg.
function btnGerarPg_Callback(hObject, eventdata, handles)
% hObject    handle to btnGerarPg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    GerarPG(handles);

function editPgArg1_Callback(hObject, eventdata, handles)
% hObject    handle to editPgArg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPgArg1 as text
%        str2double(get(hObject,'String')) returns contents of editPgArg1 as a double


% --- Executes during object creation, after setting all properties.
function editPgArg1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPgArg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPgArg2_Callback(hObject, eventdata, handles)
% hObject    handle to editPgArg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPgArg2 as text
%        str2double(get(hObject,'String')) returns contents of editPgArg2 as a double


% --- Executes during object creation, after setting all properties.
function editPgArg2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPgArg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editPgArg3_Callback(hObject, eventdata, handles)
% hObject    handle to editPgArg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPgArg3 as text
%        str2double(get(hObject,'String')) returns contents of editPgArg3 as a double


% --- Executes during object creation, after setting all properties.
function editPgArg3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPgArg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in tablePAritmetica.
function tablePAritmetica_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tablePAritmetica (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radioBi.
function radioBi_Callback(hObject, eventdata, handles)
% hObject    handle to radioBi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioBi


% --- Executes on button press in radioTg.
function radioTg_Callback(hObject, eventdata, handles)
% hObject    handle to radioTg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioTg


% --- Executes on button press in radioPf.
function radioPf_Callback(hObject, eventdata, handles)
% hObject    handle to radioPf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioPf


% --- Executes on button press in radioFp.
function radioFp_Callback(hObject, eventdata, handles)
% hObject    handle to radioFp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioFp


% --- Executes on button press in radioSe.
function radioSe_Callback(hObject, eventdata, handles)
% hObject    handle to radioSe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioSe


% --- Executes during object creation, after setting all properties.
function editF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEqGerar.
function btnEqGerar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEqGerar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    %Obt�m os dados necess�rios para a execu��o/valida��o dos m�todos
    f = FRvr(get(handles.editF,'String'));
    a = str2num(get(handles.editA,'String'));
    b = str2num(get(handles.editB,'String'));
    x0 = str2num(get(handles.editEqX0,'String'));
    x1 = str2num(get(handles.editEqX1,'String'));
    kmax = round(str2num(get(handles.editEqKmax,'String')));
    tol = str2num(get(handles.editEqTol,'String'));
    metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
    
    %Prepara o ambiente para a execua��o dos m�todos
    valid = completeValidation(handles,f,a,b,x0,x1,kmax,tol,metodo);
    
    if(~valid)
        return;
    end;
    showMessage(handles,'','g');
    setUserinteraction(handles, false);
    
    
    %O modo de como vai ser apresentado o gr�fico
    %1- anima��o 2- step 3- none
    mode =  get(get(handles.btnModeGrp,'SelectedObject'),'Tag');
    if(strcmp(mode,'radioEqStep'))
        set(handles.btnEqStep,'Enable','on');
    end
    
    switch (metodo)
      
        case 'radioBi'
               
               [biRet, k] = MBissecao(handles,f,a,b,kmax,tol, mode);
               
               %Apresenta as aproxima��es na tabela
               set(handles.tableEq,'Data',biRet);
               set(handles.textBiAprox,'String',biRet(end));
               set(handles.textBiIt,'String',k);
           
        case 'radioTg'
                df   = diff(f(sym('x')));
                df_dx   = @(x) eval(vectorize(char(df)));
                
               [tgRet, k] = MTangentes(handles,f,df_dx,str2num(get(handles.editEqX0,'String')),kmax,tol,mode);
                
               %Apresenta as aproxima��es na tabela
               set(handles.tableEq,'Data', tgRet);
               set(handles.textTgAprox,'String', tgRet(end));
               set(handles.textTgIt,'String', k); 
               
        case 'radioPf'
                [pfRet, k] = MPontoFixo(handles,f,str2num(get(handles.editEqX0,'String')),kmax,tol,mode);
               
                %Apresenta as aproxima��es na tabela
               set(handles.tableEq,'Data', pfRet);
               set(handles.textPfAprox,'String', pfRet(end));
               set(handles.textPfIt,'String', k); 
               
        case 'radioFp'
               [FpRet, k] = MFalsaPos(handles,f,a,b,kmax,tol,mode);

               %Apresenta as aproxima��es na tabela
               set(handles.tableEq,'Data', FpRet);
               set(handles.textFpAprox,'String', FpRet(end));
               set(handles.textFpIt,'String', k);
               
        case 'radioSe'
                
               [seRet, k] = MSecante(handles,f, str2num(get(handles.editEqX0,'String')),...
                                str2num(get(handles.editEqX1,'String')),kmax,tol,mode);
           
               %Apresenta as aproxima��es na tabela
               set(handles.tableEq,'Data',seRet(3:end));
               set(handles.textSeAprox,'String',seRet(end));
               set(handles.textSeIt,'String',k);
     end
    
    setUserinteraction(handles, true);
    
    if(strcmp(mode,'radioEqStep'))
        set(handles.btnEqStep,'Enable','off');
    end


function editA_Callback(hObject, eventdata, handles)
% hObject    handle to editA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editA as text
%        str2double(get(hObject,'String')) returns contents of editA as a double


% --- Executes during object creation, after setting all properties.
function editA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on editF and none of its controls.
function editF_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editF (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
    if(strcmp(eventdata.Key, 'return'))
       
        %Sem o pause, s� consegue captar a string no segundo ENTER
        pause(0.01)
        resetPlot(handles,false,false,false,false,false);
        clearText(handles);
        feq = FRvr(get(handles.editF,'String'));
        
        if(isempty(feq))
            showMessage(handles,'Enter a function of x','r');
        else
            set(handles.textEqFeedback,'String','');
            set(handles.editA,'Visible','on');
            set(handles.editA,'String','');
            set(handles.textEqA,'Visible','on');
            resetPlot(handles,true,false,false,false,false);
        end
    elseif(strcmp(eventdata.Key, 'backspace'))
            pause(0.01)
            resetPlot(handles,false,false,false,false,false);
            clearText(handles);
    end


function editA_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editF (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

    if(strcmp(eventdata.Key, 'return'))
        pause(0.01);
        a = str2num(get(handles.editA,'String'));
        
        if((isscalar(a) && isreal(a)))
            set(handles.editB,'String','')
            resetPlot(handles,true,true,false,false,false);
            set(handles.textEqFeedback,'String','');
            set(handles.editB,'Visible','on');
            set(handles.textEqB,'Visible','on');
            set(handles.textEqX0,'Visible','off');
            set(handles.editEqX0,'Visible','off');
            set(handles.editEqX0,'String','');
            set(handles.textEqX1,'Visible','off');
            set(handles.editEqX1,'Visible','off');
            set(handles.editEqX1,'String','');
        else
            resetPlot(handles,true,false,false,false,false);
            showMessage(handles,'Not a real number','r');
            set(handles.editB,'Visible','off');
            set(handles.textEqB,'Visible','off');
            set(handles.editEqKmax,'Visible','off');
            set(handles.textEqKmax,'Visible','off');
            set(handles.editEqTol,'Visible','off');
            set(handles.textEqTol,'Visible','off');
            set(handles.btnEqGerar,'Enable','off');
            set(handles.textEqX0,'Visible','off');
            set(handles.editEqX0,'Visible','off');
            set(handles.textEqX1,'Visible','off');
            set(handles.editEqX1,'Visible','off');
        end
    elseif(strcmp(eventdata.Key, 'backspace'))
        resetPlot(handles,true,false,false,false,false);
        set(handles.editB,'Visible','off');
        set(handles.textEqB,'Visible','off');
        set(handles.editEqKmax,'Visible','off');
        set(handles.textEqKmax,'Visible','off');
        set(handles.editEqTol,'Visible','off');
        set(handles.textEqTol,'Visible','off');
        set(handles.btnEqGerar,'Enable','off');
        set(handles.textEqFeedback,'String','');
        set(handles.textEqX0,'Visible','off');
        set(handles.editEqX0,'Visible','off');
        set(handles.textEqX1,'Visible','off');
        set(handles.editEqX1,'Visible','off');
       
    end
     
function editB_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editF (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

    if(strcmp(eventdata.Key, 'return'))
        pause(0.01);
        a = str2num(get(handles.editA,'String'));
        b = str2num(get(handles.editB,'String'));
        feq = FRvr(get(handles.editF,'String'));
        metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
            
        val = intervalValidation(feq,a,b);
        if(val == 0)
             if(strcmp(metodo,'radioTg') || strcmp(metodo,'radioPf') || strcmp(metodo,'radioSe'))

                set(handles.textEqFeedback,'String','');
                set(handles.textEqX0,'Visible','on');
                set(handles.editEqX0,'Visible','on');                
                set(handles.editEqX0,'String','');
                set(handles.textEqX1,'Visible','off');
                set(handles.editEqX1,'Visible','off');
                set(handles.editEqX1,'String','');
                resetPlot(handles,true,true,true,false,false);
                Show2Derivative(handles);
            else
                resetPlot(handles,true,true,true,false,false);
                showMessage(handles,'Tolerance argument is optional','g');
                set(handles.editEqKmax,'Visible','on');
                set(handles.editEqKmax,'String','');
                set(handles.textEqKmax,'Visible','on')
                set(handles.editEqKmax,'String',20);
                set(handles.btnEqGerar,'Enable','on');
                set(handles.editEqTol,'Visible','on');
                set(handles.editEqTol,'String','');
                set(handles.textEqTol,'Visible','on');
             end
        else
            if(val == 1)
                showMessage(handles,'a is invalid - Not a real number','r');
            elseif(val == 2)
                showMessage(handles,'b is invalid - Not a real number','r');
            elseif(val == 3)
                showMessage(handles,'a > b','r');
            elseif(val ==4)
                showMessage(handles,'Invalid range - f(a) * f(b) > 0','r');
            end

            resetPlot(handles,true,true,false,false,false);
            set(handles.editEqKmax,'Visible','off');
            set(handles.textEqKmax,'Visible','off')
            set(handles.btnEqGerar,'Enable','off');
            set(handles.editEqTol,'Visible','off');
            set(handles.textEqTol,'Visible','off');
            set(handles.textEqX0,'Visible','off');
            set(handles.editEqX0,'Visible','off');
            set(handles.textEqX1,'Visible','off');
            set(handles.editEqX1,'Visible','off');
        end
        
    elseif(strcmp(eventdata.Key, 'backspace'))
        resetPlot(handles,true,true,false,false,false);
        set(handles.editEqKmax,'Visible','off');
        set(handles.textEqKmax,'Visible','off');
        set(handles.editEqTol,'Visible','off');
        set(handles.textEqTol,'Visible','off');
        set(handles.btnEqGerar,'Enable','off');
        set(handles.textEqFeedback,'String','');
        set(handles.textEqX0,'Visible','off');
        set(handles.editEqX0,'Visible','off');
        set(handles.textEqX1,'Visible','off');
        set(handles.editEqX1,'Visible','off');
    end
    
% --- Executes on key press with focus on editEqX0 and none of its controls.
function editEqX0_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editEqX0 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
        
        if(strcmp(eventdata.Key, 'return'))
            pause(0.01);
            a = str2num(get(handles.editA,'String'));
            b = str2num(get(handles.editB,'String'));
            x0 = str2num(get(handles.editEqX0,'String'));
            feq =FRvr(get(handles.editF,'String'));
            metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
            
            val = AproxValidation(handles,feq,x0,a,b);
                
            if(val == 0)
                 if(strcmp(metodo,'radioSe'))
                    resetPlot(handles,true,true,true,true,false);
                    set(handles.textEqFeedback,'String','');
                    set(handles.textEqX1,'Visible','on');
                    set(handles.editEqX1,'Visible','on');
                    set(handles.editEqX1,'String','');
                    Show2Derivative(handles)
                else
                    resetPlot(handles,true,true,true,true,false);
                    showMessage(handles, 'Tolerance argument is optional', 'g');
                    set(handles.editEqKmax,'Visible','on');
                    set(handles.editEqKmax,'String','');
                    set(handles.textEqKmax,'Visible','on')
                    set(handles.editEqKmax,'String',20);
                    set(handles.btnEqGerar,'Enable','on');
                    set(handles.editEqTol,'Visible','on');
                    set(handles.editEqTol,'String','');
                    set(handles.textEqTol,'Visible','on');
                end
            else
                if(val == 1)
                    showMessage(handles,'x0 is invalid - Not a real number','r');
                elseif(val == 2)
                    showMessage(handles,'x0 is invalid - Out of range [a b]','r');
                elseif(val == 3)
                    showMessage(handles,'x0 is invalid - f(x0) * f''''(x0) > 0','r');
                end
                
                resetPlot(handles,true,true,true,false,false);
                set(handles.editEqX0,'String','');
                set(handles.editEqX1,'Visible','off');
                set(handles.textEqX1,'Visible','off');
                set(handles.editEqKmax,'Visible','off');
                set(handles.textEqKmax,'Visible','off')
                set(handles.editEqTol,'Visible','off');
                set(handles.textEqTol,'Visible','off');
                Show2Derivative(handles)
            end
        elseif(strcmp(eventdata.Key, 'backspace'))

            
            resetPlot(handles,true,true,true,false,false);
            set(handles.editEqKmax,'Visible','off');
            set(handles.textEqKmax,'Visible','off');
            set(handles.editEqTol,'Visible','off');
            set(handles.textEqTol,'Visible','off');
            set(handles.btnEqGerar,'Enable','off');
            set(handles.textEqX1,'Visible','off');
            set(handles.editEqX1,'Visible','off');
            set(handles.textEqFeedback,'String','');
            Show2Derivative(handles);
        end  

        
        
% --- Executes on key press with focus on editEqX1 and none of its controls.
function editEqX1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editEqX1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on key press with focus on editEqKmax and none of its controls.

    if(strcmp(eventdata.Key, 'return'))
                pause(0.01);
                a = str2num(get(handles.editA,'String'));
                b = str2num(get(handles.editB,'String'));
                x0 = str2num(get(handles.editEqX0,'String'));
                x1 = str2num(get(handles.editEqX1,'String'));
                feq =FRvr(get(handles.editF,'String'));
                metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
                
                %valida��o do x1
                val = AproxValidation(handles,feq,x1,a,b)
                if(x1 < x0)
                    showMessage(handles,'x1 is less than x0','r');
                elseif(val == 0)
                    resetPlot(handles,true,true,true,true,true);
                    showMessage(handles,'Tolerance argument is optional','g');
                    set(handles.editEqKmax,'Visible','on');
                    set(handles.textEqKmax,'Visible','on')
                    set(handles.editEqKmax,'String',20);
                    set(handles.btnEqGerar,'Enable','on');
                    set(handles.editEqTol,'Visible','on');
                    set(handles.textEqTol,'Visible','on');
                else
                    if(val == 1)
                        showMessage(handles,'x0 is invalid - Not a real number','r');
                    elseif(val == 2)
                        showMessage(handles,'x0 is invalid - Out of range [a b]','r');
                    elseif(val == 3)
                        showMessage(handles,'x0 is invalid - f(x0) * f''''(x0) > 0','r');
                    end
                    
                    resetPlot(handles,true,true,true,true,false);
                    set(handles.editEqX1,'String','');
                    set(handles.editEqKmax,'Visible','off');
                    set(handles.editEqKmax,'String','');
                    set(handles.textEqKmax,'Visible','off')
                    set(handles.editEqTol,'Visible','off');
                    set(handles.textEqTol,'Visible','off');
                    set(handles.editEqTol,'String','');
                    Show2Derivative(handles);
                end
            elseif(strcmp(eventdata.Key, 'backspace'))
                resetPlot(handles,true,true,true,true,false);
                set(handles.editEqKmax,'Visible','off');
                set(handles.textEqKmax,'Visible','off');
                set(handles.editEqTol,'Visible','off');
                set(handles.textEqTol,'Visible','off');
                set(handles.btnEqGerar,'Enable','off');
                set(handles.textEqFeedback,'String','');
                Show2Derivative(handles);
    end  

function editEqKmax_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editEqKmax (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
  if(strcmp(eventdata.Key, 'return'))
        pause(0.01);
        Kmax = str2num(get(handles.editEqKmax,'String'));
        Kmax = round(Kmax);
        
        if(~(isscalar(Kmax) && isreal(Kmax)))
            resetPlot(handles,true,true,true,true,true);
            set(handles.editEqKmax,'String','');
            showMessage(handles,'Not a real number','r');
            set(handles.btnEqGerar,'Enable','off');
        elseif(Kmax <= 0)
            showMessage(handles,'Only positive numbers allowed','r');
        else
            resetPlot(handles,true,true,true,true,true);
            showMessage(handles,'Tolerance argument is optional','g');
            set(handles.btnEqGerar,'Enable','on');
            
        end
  elseif(strcmp(eventdata.Key, 'backspace'))
    resetPlot(handles,true,true,true,true,true);
    showMessage(handles,'','g');
    set(handles.btnEqGerar,'Enable','off');
  end

% --- Executes on key press with focus on editEqTol and none of its controls.
function editEqTol_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to editEqTol (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
  if(strcmp(eventdata.Key, 'return'))
        pause(0.01);
        tol = str2num(get(handles.editEqTol,'String'));
        
        metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
        
        if(~(isscalar(tol) && isreal(tol)))
            resetPlot(handles,true,true,true,true);
            set(handles.editEqTol,'String','');
            showMessage(handles,'Not a real number','r');
        elseif(tol <= 0)
            showMessage(handles,'Only positive numbers allowed','r');
        else
            resetPlot(handles,true,true,true,true,true);
            set(handles.textEqFeedback,'String','');
            
            if(strcmp(metodo,'radioBi'))
                %Calcular o n�mero de itera��es necess�rias
                a = str2num(get(handles.editA,'String'));
                b = str2num(get(handles.editB,'String'));
                n = ceil(log2((b-a)/tol));
                set(handles.editEqKmax,'String',num2str(n));
                str = sprintf('Tip: To achieve the intended tolerance, %d iterations are required',n);
                showMessage(handles,str,'g');
            end
            
        end
  elseif(strcmp(eventdata.Key, 'backspace'))
      showMessage(handles,'','g');
      resetPlot(handles,true,true,true,true,true);
  end

function editF_Callback(hObject, eventdata, handles)
% hObject    handle to editB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB as text
%        str2double(get(hObject,'String')) returns contents of editB as a double

function editB_Callback(hObject, eventdata, handles)
% hObject    handle to editB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editB as text
%        str2double(get(hObject,'String')) returns contents of editB as a double


% --- Executes during object creation, after setting all properties.
function editB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEqKmax_Callback(hObject, eventdata, handles)
% hObject    handle to editEqKmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEqKmax as text
%        str2double(get(hObject,'String')) returns contents of editEqKmax as a double


% --- Executes during object creation, after setting all properties.
function editEqKmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEqKmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEqTol_Callback(hObject, eventdata, handles)
% hObject    handle to editEqTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEqTol as text
%        str2double(get(hObject,'String')) returns contents of editEqTol as a double


% --- Executes during object creation, after setting all properties.
function editEqTol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEqTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in btnRadioGrp.
function btnRadioGrp_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in btnRadioGrp 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    switch (get(eventdata.NewValue,'Tag'))
    
        case 'radioBi'
                changeM(handles);
        case 'radioTg'
                changeM(handles);
        case 'radioPf'
                changeM(handles);
        case 'radioFp'
                changeM(handles);
        case 'radioSe'
                changeM(handles);
    end


% --- Executes when selected object is changed in btnModeGrp.
function btnModeGrp_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in btnModeGrp 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
     switch (get(eventdata.NewValue,'Tag'))
    
        case 'radioEqAnim'
                set(handles.btnEqStep,'Visible','off');
        case 'radioEqStep'
                set(handles.btnEqStep,'Visible','on');
        case 'radioEqNone'
                set(handles.btnEqStep,'Visible','off');
        
    end

% --- Executes on button press in btnEqStep.
function btnEqStep_Callback(hObject, eventdata, handles)
% hObject    handle to btnEqStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    



function editEqX0_Callback(hObject, eventdata, handles)
% hObject    handle to editEqX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEqX0 as text
%        str2double(get(hObject,'String')) returns contents of editEqX0 as a double


% --- Executes during object creation, after setting all properties.
function editEqX0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEqX0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in btnEqReset.
function btnEqReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnEqReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    resetData(handles)


% --- Executes during object creation, after setting all properties.
function btnModeGrp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnModeGrp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %set(hObject,'SelectedObject',[]);



function editEqX1_Callback(hObject, eventdata, handles)
% hObject    handle to editEqX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEqX1 as text
%        str2double(get(hObject,'String')) returns contents of editEqX1 as a double


% --- Executes during object creation, after setting all properties.
function editEqX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEqX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEqBack.
function btnEqBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnEqBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.panelEq,'Visible','off');
    cla(handles.axesEq);
    set(handles.editF,'String','');
    clearText(handles);
    resetData(handles)
    setUserinteraction(handles, true);
    set(handles.btnEqGerar ,'Enable', 'off');



% --- Executes on button press in btnPolTaylor.
function btnPolTaylor_Callback(hObject, eventdata, handles)
% hObject    handle to btnPolTaylor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in btnMaquina.
try
    winopen('Assets/PolinomioTaylor_TP_AM2.ggb');
catch
    myicon = imread('Icons\geogebra.png');
    h = msgbox({'N�o tem o Geogebra instalado!'}...
                ,'Invalid Path','custom',myicon);
    uiwait(h) 
    try
        url = 'https://www.geogebra.org/download?lang=pt_PT';
        web(url,'-browser')
    catch
        errordlg('Sem conex�o � internet','File Error');
    end
end

function btnMaquina_Callback(hObject, eventdata, handles)
% hObject    handle to btnMaquina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hSolucao.filhas(1)= MaquinaDerivadaPrimitiva('Visible','on');  

% --- Executes on button press in btnAbout.


% --- Executes on button press in btnDev.
function btnDev_Callback(hObject, eventdata, handles)
% hObject    handle to btnDev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hSolucao.filhas(2)= DerivacaoNumerica('Visible','on');  

% --- Executes on button press in btnInt.
function btnInt_Callback(hObject, eventdata, handles)
% hObject    handle to btnInt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hSolucao.filhas(3)= GUI_IntNumerica('Visible','on'); 

% --------------------------------------------------------------------
function btnAbout_Callback(hObject, eventdata, handles)
% hObject    handle to btnAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelAbout, 'visible', 'On');

% --- Executes on button press in btnFechar.
function btnFechar_Callback(hObject, eventdata, handles)
% hObject    handle to btnFechar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelMessage,'visible', 'Off');
set(handles.panelAbout, 'visible', 'on');


% --- Executes on button press in btnCloseAbout.
function btnCloseAbout_Callback(hObject, eventdata, handles)
% hObject    handle to btnCloseAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelAbout, 'visible', 'off');

% --- Executes on button press in bntSend.
function bntSend_Callback(hObject, eventdata, handles)
% hObject    handle to bntSend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mail = 'matlab@danieloliveira.me';
password = 'matlab';

setpref('Internet','E_mail', mail);
setpref('Internet','SMTP_Server','chipmania.pt');
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.remove('mail.smtp.socketFactory.class'); 
%props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','25');
%props.setProperty('mail.smtp.starttls.enable', 'true');


sendmail(get(handles.emailSend, 'String'),'Actividade 3 - AM2',get(handles.editMessage, 'String'));
set(handles.panelMessage,'visible', 'Off');
set(handles.panelAbout, 'visible', 'On');
set(handles.textFeedback,'String', 'Email enviado com sucesso');

% --- Executes on button press in btnEmailJorge.
function btnEmailJorge_Callback(hObject, eventdata, handles)
% hObject    handle to btnEmailJorge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelMessage,'visible', 'on');
set(handles.panelAbout, 'visible', 'Off');
set(handles.emailSend, 'String', 'jorgemdcosta@gmail.com');

% --- Executes on button press in btnEmailDocente.
function btnEmailDocente_Callback(hObject, eventdata, handles)
% hObject    handle to btnEmailDocente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.panelMessage,'visible', 'on');
set(handles.panelAbout, 'visible', 'Off');
set(handles.emailSend, 'String', 'armenioc@isec.pt');

% --- Executes on button press in btnFaceDocente.
function btnFaceDocente_Callback(hObject, eventdata, handles)
% hObject    handle to btnFaceDocente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.facebook.com/armeniocorreia';
web(url,'-browser')

% --- Executes on button press in btnFaceJorge.
function btnFaceJorge_Callback(hObject, eventdata, handles)
% hObject    handle to btnFaceJorge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.facebook.com/jorge.costa.7921';
web(url,'-browser')



function editMessage_Callback(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMessage as text
%        str2double(get(hObject,'String')) returns contents of editMessage as a double


% --- Executes during object creation, after setting all properties.
function editMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btnSair_Callback(hObject, eventdata, handles)
% hObject    handle to btnSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --------------------------------------------------------------------
function btnGeogebra_Callback(hObject, eventdata, handles)
% hObject    handle to btnGeogebra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    winopen('C:\Program Files (x86)\GeoGebra 5.0\GeoGebra.exe');
catch
    myicon = imread('Icons\geogebra.png');
    h = msgbox({'Geogebra.exe n�o encontrado' ' ' 'Selecione a directoria do geogebra' ' Exemplo: C:\Program Files (x86)\GeoGebra 5.0'},'Invalid Path','custom',myicon);
    uiwait(h) 
    folder = uigetdir('C:\');
    pahtGeogebra = strcat(folder,'\GeoGebra.exe');
    
    try
        winopen(pahtGeogebra);
    catch
        errordlg('Path inv�lido','File Error');
    end
end
% --------------------------------------------------------------------
function btnWolfram_Callback(hObject, eventdata, handles)
% hObject    handle to btnWolfram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://www.wolframalpha.com/';
web(url,'-browser')


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function until_Callback(hObject, eventdata, handles)
% hObject    handle to until (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
