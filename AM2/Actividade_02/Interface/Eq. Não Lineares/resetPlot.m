%resetPlot
%   Fun��o respons�vel por desenhar os gr�fios/pontos/linhas da GUI
%INPUT
%   handles - handles dos objectos da GUI
%   drawPlot(true/false) - Desenha o gr�fico 
%   drawPa (true/false)  - Desenhar o intervalo inferior a
%   drawPb (true/false)  - Desenhar o intervalo superior b
%   drawX0 (true/false)  - Desenhar a aproxmi��o x0
%   drawX1 (true/false)  - Desenhar a aproxima��o x1
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function resetPlot( handles, drawPlot, drawPa, drawPb, drawX0, drawX1)

persistent feq    
    limA = -4;
    limB = 4;
    a = -4;
    b = 4;
    axes(handles.axesEq);
    cla(handles.axesEq);
    legend('off')
    %hLegend = legend(handles.axesEq,[]));
     
    axis('auto');
    
    metodo = get(get(handles.btnRadioGrp,'SelectedObject'),'Tag');
    
    if(drawPa)
    	a = str2num(get(handles.editA,'String'));
    end
    if(drawPb)
        b = str2num(get(handles.editB,'String'));
    end
    
    if(drawPlot)
        feq = FRvr(get(handles.editF,'String'));

        if(~isempty(feq))

            %Centar o gr�fico no eixo dos x em torno do 0
            side = (abs(a)+abs(b))/4;
            
            if(a > b)
                limB = a;
            elseif(a <= -4 || b >= 4)
                limA = a-side;
                limB = b+side;
            end
            
            %obter os limites do gr�fico

            
            x= limA:0.1:limB;
            plot(x,feq(x));
            
            limitY = get(gca, 'Ylim')
            yLimA = -((abs(limitY(1)) + abs(limitY(2))) / 2)
            yLimB = -yLimA;
            xlim([limA limB]);
            ylim([yLimA yLimB]);
            
            grid on;
            hold on; % para sobrepor gr�ficos num mesmo sistema de eixos   
            plot(x,zeros(length(x)))% esbo�ar o eixo dos xx
            
            hLegend = legend('f (x)');
            set(hLegend,'FontSize',14);
        end 
    end 
    
        if(drawPa)
            hold on; % para sobrepor gr�ficos num mesmo sistema de eixos
            limitY = get(gca, 'Ylim')
            line([a a],[limitY(1) * 0.80 limitY(2) * 0.80],'Color','g','LineStyle','-','LineWidth',2);
            %plot(a,0,'ro');
        end
        if(drawPb)
            hold on; % para sobrepor gr�ficos num mesmo sistema de eixos
            line([b b],[limitY(1) * 0.80 limitY(2) * 0.80],'Color','g','LineStyle','-','LineWidth',2);
            %%plot(b,0,'ro');
            
        end 
   
    if(strcmp(metodo,'radioTg') || strcmp(metodo,'radioSe'))
        if(drawX0)
            
            y = [limitY(1) * 0.80 limitY(2) * 0.80];
            x0 = str2num(get(handles.editEqX0,'String'));
            plot(x0,0,'bo');
            line([x0 x0],y,'Color','red','LineStyle','--');
        end
    end
    
    if(drawX1 &&  strcmp(metodo,'radioSe'))
        limitY = get(gca, 'Ylim')
        y = [limitY(1) * 0.80 limitY(2) * 0.80];
        x1 = str2num(get(handles.editEqX1,'String'));
        plot(x1,0,'bo');
        line([x1 x1],y,'Color','red','LineStyle','--');
    end
        
end

