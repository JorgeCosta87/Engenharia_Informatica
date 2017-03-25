% ObterDados
%
%   Receve os dados do utilizador e procede � sua valida��o.
%
%Output:
%   data - Vector com os dados introduzidos validados
%        data(1) - Primeiro elemento
%        data(2) - Raz�o da Progress�o
%        data(3) - N�mero de elementos
%


function data = ObterDados()

    prompt = { 'Insira o primeiro elemento: ','Raz�o: ', 'N�mero de Elementos: ' };
    title = 'Progressao';

        while 1
           answer=inputdlg(prompt,title,[1 60]);
           
           %Caso seja pressionado o btn cancel, termina o ciclo
           if (isempty(answer))
               data = [];
               break;
           end
           
           try
                data(1) = str2num(answer{1}); 
                data(2) = str2num(answer{2});
                data(3) = str2num(answer{3})   
           catch
                h = errordlg('Os dados inseridos n�o s�o v�lidos!','Dados inv�lidos', 'modal');
                % Coloca a execu��o do programa suspensa at� ser
                % pressionado o bot�o OK da dialog box
                waitfor(h); 
                continue;
           end

            if (data(3)==floor(data(3)) && data(3) > 2)
                break;
            else
                % A error dialog box retorna o seu handle
                h = errordlg('O n�mero total de elementos tem de ser superior a 2','Dados inv�lidos','modal');
                waitfor(h);
            end
        end
        
end

