function GerarPa( handles )
%Descri��o:
%       1� - Procede � valida��o dos dados
%       2� - Chama a fun��o que gera a progress�o aritm�tica e a sua soma
%       4� - Contabiliza o tempo de processamento
%       3� - Apresenta os resultados obtidos
%
%Input:
%       Handles - handles dos objectos da GUI

    try
        arg(1) = str2num(get(handles.editPaArg1,'String'));
        arg(2) = str2num(get(handles.editPaArg2,'String'));
        arg(3) = str2num(get(handles.editPaArg3,'String'));
    catch
        set(handles.textPaValid,'String','Os dados inseridos n�o s�o v�lidos!');
        return;
    end
    
    if (arg(3) < 2)
        set(handles.textPaValid,'String','O n�mero total de elementos tem de ser superior a 2');
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

