% MenuProgressaoGeométrica
%   05/3/2017 - Jorge Costa .: a21250797@alunos.isec.pt 
%
% Chamada de SUB-FUNÇÕES
%   ObterDados()
%

function MenuProgressaoGeometrica()

a = [];
MenuProgGeometrica = 1;
while MenuProgGeometrica ~= 3
    clc;
    MenuProgGeometrica = menu('Progressão Geométrica', ...
                             'Gerar Progressão Geométrica',...
                             'Somar elementos da Progressão Geométrica',...
                             'Saír');
    switch MenuProgGeometrica
        case 1
            %Obtém os dados para o problema e efectua a validação destes.
            data = ObterDados();
            
            if(isempty(data))
                continue;
            end
            
            %Gera a PG
            a = gerarPGeometrica_v4(data(1),data(2),data(3));
            
            info = {'A Progressão Geométrica gerada é:';' ';num2str(a);...
                    ' ';'Prima uma OK para continuar ...'};
            
            %Cria uma msgbox
            hm = msgbox(info);
            
            %Redimensiona a msgbox com base no número de elementos da progressão
            heightSize = (floor(data(3) / 19) * 90) + 120;
            
            %Define o tamanho da msgbox
            boxSize = [450 heightSize];
            
            %Obtém a dimensão do ecrã
            screensize = get(0,'ScreenSize');
            xPos = ceil(screensize(3) / 2) - (boxSize(1)); 
            yPos = ceil(screensize(4) / 2) - (boxSize(2));
            
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
                S = SomaPGeometrica(a);
                
                msg = {'A soma dos elementos da PG introduzida é: ', num2str(S)};
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
                wh = warndlg('Começe por introduzir a Progressão Geométrica',...
                             'Notificação','modal');
                waitfor(wh);
            end
    end
end