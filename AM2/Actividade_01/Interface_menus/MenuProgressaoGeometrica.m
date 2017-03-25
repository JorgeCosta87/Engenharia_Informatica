% MenuProgressaoGeom�trica
%   05/3/2017 - Jorge Costa .: a21250797@alunos.isec.pt 
%
% Chamada de SUB-FUN��ES
%   ObterDados()
%

function MenuProgressaoGeometrica()

a = [];
MenuProgGeometrica = 1;
while MenuProgGeometrica ~= 3
    clc;
    MenuProgGeometrica = menu('Progress�o Geom�trica', ...
                             'Gerar Progress�o Geom�trica',...
                             'Somar elementos da Progress�o Geom�trica',...
                             'Sa�r');
    switch MenuProgGeometrica
        case 1
            %Obt�m os dados para o problema e efectua a valida��o destes.
            data = ObterDados();
            
            if(isempty(data))
                continue;
            end
            
            %Gera a PG
            a = gerarPGeometrica_v4(data(1),data(2),data(3));
            
            info = {'A Progress�o Geom�trica gerada �:';' ';num2str(a);...
                    ' ';'Prima uma OK para continuar ...'};
            
            %Cria uma msgbox
            hm = msgbox(info);
            
            %Redimensiona a msgbox com base no n�mero de elementos da progress�o
            heightSize = (floor(data(3) / 19) * 90) + 120;
            
            %Define o tamanho da msgbox
            boxSize = [450 heightSize];
            
            %Obt�m a dimens�o do ecr�
            screensize = get(0,'ScreenSize');
            xPos = ceil(screensize(3) / 2) - (boxSize(1)); 
            yPos = ceil(screensize(4) / 2) - (boxSize(2));
            
            %coloca a msgbox no meio do ecr�
            set(hm, 'position', [xPos yPos boxSize(1) boxSize(2)]);
            
            %Altera o tamanho da letra
            ch = get( hm, 'CurrentAxes' );
            tp = get( ch, 'Children' );
            set( tp, 'FontSize',11 ); %makes text bigger
            
            %Suspende o sistema, at� ser presssionado o bot�o ok
            uiwait(hm);
  
        case 2
            if(~isempty(a))
                S = SomaPGeometrica(a);
                
                msg = {'A soma dos elementos da PG introduzida �: ', num2str(S)};
                hm = msgbox(msg);
                
                %O c�digo em baixo deveria ser colocado numa fun��o aux
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
                wh = warndlg('Come�e por introduzir a Progress�o Geom�trica',...
                             'Notifica��o','modal');
                waitfor(wh);
            end
    end
end