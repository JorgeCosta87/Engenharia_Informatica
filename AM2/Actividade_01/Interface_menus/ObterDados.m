% ObterDados
%
%   Receve os dados do utilizador e procede à sua validação.
%
%Output:
%   data - Vector com os dados introduzidos validados
%        data(1) - Primeiro elemento
%        data(2) - Razão da Progressão
%        data(3) - Número de elementos
%


function data = ObterDados()

    prompt = { 'Insira o primeiro elemento: ','Razão: ', 'Número de Elementos: ' };
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
                h = errordlg('Os dados inseridos não são válidos!','Dados inválidos', 'modal');
                % Coloca a execução do programa suspensa até ser
                % pressionado o botão OK da dialog box
                waitfor(h); 
                continue;
           end

            if (data(3)==floor(data(3)) && data(3) > 2)
                break;
            else
                % A error dialog box retorna o seu handle
                h = errordlg('O número total de elementos tem de ser superior a 2','Dados inválidos','modal');
                waitfor(h);
            end
        end
        
end

