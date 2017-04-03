%changeM
%   Função responsável por esconder/mostrar os 
%   dados relevantes para cada um dos métodos, quando este é alterado 
%INPUT
%   handles - handles dos objectos da GUI
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 


function  changeM( handles )
    
  resetPlot(handles,false,false,false,false,false);
  metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
 
  if(strcmp(metodo,'radioTg') || strcmp(metodo,'radioSe'))
  
      if(isempty(get(handles.editB,'String')))
        set(handles.editA,'Visible','off');
        set(handles.textEqA,'Visible','off');
        set(handles.editB,'Visible','off');
        set(handles.textEqB,'Visible','off');
        set(handles.textEqX0,'Visible','off');
        set(handles.editEqX0,'Visible','off');
        set(handles.editEqX0,'String','');
        set(handles.editEqKmax,'Visible','off');
        set(handles.textEqKmax,'Visible','off');
        set(handles.editEqTol,'Visible','off');
        set(handles.textEqTol,'Visible','off');
        set(handles.btnEqGerar,'Enable','off');
        resetPlot(handles,true,false,false,false,false);
      elseif(isempty(get(handles.editEqX0,'String')))
        set(handles.textEqX0,'Visible','on');
        set(handles.editEqX0,'Visible','on');
        set(handles.editEqKmax,'Visible','off');
        set(handles.textEqKmax,'Visible','off');
        set(handles.editEqTol,'Visible','off');
        set(handles.textEqTol,'Visible','off');
        set(handles.btnEqGerar,'Enable','off');
        resetPlot(handles,true,true,true,false,false);
        Show2Derivative(handles);
      else       
          if(strcmp(metodo,'radioSe'))
              if(isempty(get(handles.editEqX1,'String')))
                  set(handles.textEqX0,'Visible','on');
                  set(handles.editEqX0,'Visible','on');
                  set(handles.textEqX1,'Visible','on');
                  set(handles.editEqX1,'Visible','on');
                  set(handles.editEqKmax,'Visible','off');
                  set(handles.textEqKmax,'Visible','off');
                  set(handles.editEqTol,'Visible','off');
                  set(handles.textEqTol,'Visible','off');
                  set(handles.btnEqGerar,'Enable','off');
                  resetPlot(handles,true,true,true,true,false);
                  Show2Derivative(handles);
              else
                  set(handles.editA,'Visible','on');
                  set(handles.editB,'Visible','on');
                  set(handles.textEqX0,'Visible','on');
                  set(handles.editEqX0,'Visible','on');
                  set(handles.textEqX1,'Visible','on');
                  set(handles.editEqX1,'Visible','on');
                  set(handles.editEqKmax,'Visible','on');
                  set(handles.textEqKmax,'Visible','on');
                  set(handles.editEqTol,'Visible','on');
                  set(handles.textEqTol,'Visible','on');
                  set(handles.btnEqGerar,'Enable','on');
                  resetPlot(handles,true,true,true,true,true);
              end
          else
              set(handles.editA,'Visible','on');
              set(handles.editB,'Visible','on');
              set(handles.textEqX0,'Visible','on');
              set(handles.editEqX0,'Visible','on');
              set(handles.textEqX1,'Visible','off');
              set(handles.editEqX1,'Visible','off');
              set(handles.editEqKmax,'Visible','on');
              set(handles.textEqKmax,'Visible','on');
              set(handles.editEqTol,'Visible','on');
              set(handles.textEqTol,'Visible','on');
              set(handles.btnEqGerar,'Enable','on');
              resetPlot(handles,true,true,true,true,false);
          end
      end
  elseif(strcmp(metodo,'radioBi') || strcmp(metodo,'radioFp'))
      if(isempty(get(handles.editB,'String')))
          set(handles.editEqKmax,'Visible','off');
          set(handles.textEqKmax,'Visible','off');
          set(handles.editEqTol,'Visible','off');
          set(handles.textEqTol,'Visible','off');
          set(handles.btnEqGerar,'Enable','off');
      else
          resetPlot(handles,true,true,true,false,false);
          set(handles.textEqX0,'Visible','off');
          set(handles.editEqX0,'Visible','off');
          set(handles.textEqX1,'Visible','off');
          set(handles.editEqX1,'Visible','off');
          set(handles.editEqKmax,'Visible','on');
          set(handles.textEqKmax,'Visible','on');
          set(handles.editEqTol,'Visible','on');
          set(handles.textEqTol,'Visible','on');
          set(handles.btnEqGerar,'Enable','on');
      end
  else
%       set(handles.editEqKmax,'Visible','off');
%       set(handles.textEqKmax,'Visible','off');
%       set(handles.editEqTol,'Visible','off');
%       set(handles.textEqTol,'Visible','off');
  end
  
  set(handles.textEqShowAprox,'String','0');
  set(handles.textEqFeedback,'String','');
  set(handles.tableEq, 'Data', cell(size(get(handles.tableEq,'Data'))));
end

