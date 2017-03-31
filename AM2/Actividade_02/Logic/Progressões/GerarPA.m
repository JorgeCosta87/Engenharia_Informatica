function GerarPa( handles )
%Descrição:
%       1º - Procede à validação dos dados
%       2º - Chama a função que gera a progressão aritmética e a sua soma
%       4º - Contabiliza o tempo de processamento
%       3º - Apresenta os resultados obtidos
%
%Input:
%       Handles - handles dos objectos da GUI

    try
        arg(1) = str2num(get(handles.editPaArg1,'String'));
        arg(2) = str2num(get(handles.editPaArg2,'String'));
        arg(3) = str2num(get(handles.editPaArg3,'String'));
    catch
        set(handles.textPaValid,'String','Os dados inseridos não são válidos!');
        return;
    end
    
    if (arg(3) < 2)
        set(handles.textPaValid,'String','O número total de elementos tem de ser superior a 2');
        return;
    end
    
    set(handles.textPaValid,'String','');
    
    tic
    vResult = gerarPAritmetica_v4(arg(1),arg(2),arg(3));
    tProc = toc;     
    
    %Mostra o tempo de processamento
    set(handles.textPaTime,'Visible','on');
    set(handles.textPaShowTime,'String',num2str(tProc));

    %Preenche a tabela com os valores da PA
    set(handles.tablePAritmetica,'Visible','on');
    set(handles.tablePAritmetica,'Data',vResult);

    %Escreve a soma da PA na caixa de texto
    set(handles.textPaSoma,'Visible','on');
    set(handles.textPaShowSoma,'String',num2str(SomaPAritmetica(vResult)));

end

