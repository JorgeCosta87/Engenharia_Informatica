function GerarPa( handles )
%Descrição:
%       1º - Procede à validação dos dados
%       2º - Chama a função que gera a progressão geométrica e a sua soma
%       4º - Contabiliza o tempo de processamento
%       3º - Apresenta os resultados obtidos
%
%Input:
%       Handles - handles dos objectos da GUI

    try
        arg(1) = str2num(get(handles.editPgArg1,'String'));
        arg(2) = str2num(get(handles.editPgArg2,'String'));
        arg(3) = str2num(get(handles.editPgArg3,'String'));
    catch
        set(handles.textPgValid,'String','Os dados inseridos não são válidos!');
        return;
    end
    
    if (arg(2) < 2 )
        set(handles.textPgValid,'String','A razão tem de ser superior a 2');
        return;
    else if(arg(3) < 2)
        set(handles.textPgValid,'String','O número total de elementos tem de ser superior a 2');
        return;            
        end
    end
    
    set(handles.textPgValid,'String','');
    tic
    vResult = gerarPGeometrica_v4(arg(1),arg(2),arg(3));
                                
   %Mostra o tempo de processamento
   set(handles.textPgTime,'Visible','on');
   set(handles.textPgShowTime,'String',num2str(toc));
   
   %Preenche a tabela com os valores da PA
   set(handles.tablePGeometrica,'Visible','on');
   set(handles.tablePGeometrica,'Data',vResult);
   
   %Escreve a soma da PA na caixa de texto
   set(handles.textPgSoma,'Visible','on');
   set(handles.textPgShowSoma,'String',num2str(SomaPGeometrica(vResult)));

end

