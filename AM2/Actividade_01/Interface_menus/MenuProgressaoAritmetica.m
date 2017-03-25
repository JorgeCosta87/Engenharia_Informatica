% MenuProgressaoAritmetica
%   05/3/2017 - Jorge Costa .: a21250797@alunos.isec.pt 
%
% Chamada de SUB-FUNÇÕES
%   ObterDados()
%

function MenuProgressaoAritmetica()

a = [];
menuProgAritmetica = 1;
while menuProgAritmetica ~= 3
    clc;
    menuProgAritmetica = menu('Progressão Aritmética', ...
                             'Gerar Progressão Aritmética',...
                             'Somar elementos da Progressão Aritmética',...
                             'Saír');
    switch menuProgAritmetica
        case 1
            %Obtém os dados para o problema e efectua a validação destes.
            data = ObterDados();
            
            if(isempty(data))
                continue;
            end
            
            %Gera a PG
            a = gerarPAritmetica_v4(data(1),data(2),data(3));
            
            test = {'A Progressão Aritmética gerada é:';' ';num2str(a);...
                    ' ';'Prima uma OK para continuar ...'};
            
            %Cria uma msgbox
            hm = msgbox(test);
            
            %Redimensiona a msgbox com base no número de elementos da progressão
            heightSize = (floor(data(3) / 19) * 20) + 120;
            
            %Define o tamanho da msgbox
            boxSize = [375 heightSize];
            
            %Obtém a dimensão do ecrã
            screensize = get(0,'ScreenSize');
            xPos = ceil(screensize(3) / 2) - (boxSize(1)) 
            yPos = ceil(screensize(4) / 2) - (boxSize(2))
            
            %coloca a msgbox no meio do ecrã
            set(hm, 'position', [xPos yPos boxSize(1) boxSize(2)]);
            
            %Altera o tamanho da letra
            ch = get( hm, 'CurrentAxes' );
            tp = get( ch, 'Children' );
            set( tp, 'FontSize',11 ); %makes text bigger
            
            %Suspende o sistema, até ser presssionado o botão ok
            uiwait(hm);
  
        case 2
            if(~isempty(a))
                S = SomaPAritmetica(a);
                msg = {'A soma dos elementos da PA introduzida é: ', num2str(S)};
                hm = msgbox(msg);
                
                %O código em baixo deveria ser colocado numa função aux
                heightSize = 70
                boxSize = [450 heightSize];
                screensize = get(0,'ScreenSize');
                xPos = ceil(screensize(3) / 2) - (boxSize(1)); 
                yPos = ceil(screensize(4) / 2) - (boxSize(2));
                set(hm, 'position', [xPos yPos boxSize(1) boxSize(2)]); 
                ch = get( hm, 'CurrentAxes' );
                tp = get( ch, 'Children' );
                set( tp, 'FontSize',11 ); %makes text bigger
                uiwait(hm);
            else
                wh = warndlg('Começe por introduzir a Progressão aritmética',...
                             'Notificação','modal');
                waitfor(wh);
            end
    end
end
            