function resetPlot( handles, drawPlot, drawPa, drawPb, drawX0, drawX1)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
persistent feq    
    limA = -4;
    limB = 4;
    a = -4;
    b = 4;
    axes(handles.axesEq);
    cla(handles.axesEq);
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

            %Centar o gráfico no eixo dos x em torno do 0
            side = (abs(a)+abs(b))/4;
            
            if(a <= -4 || b >= 4)
                limA = a-side;
                limB = b+side;
            end

            x= limA:0.1:limB;
            plot(x,feq(x));
            
            xlim([limA limB]);
            ylim([-50 50]);
            
            grid on;
            hold on; % para sobrepor gráficos num mesmo sistema de eixos   
            plot(x,zeros(length(x)))% esboçar o eixo dos xx
        end 
    end 
    
        if(drawPa)
            hold on; % para sobrepor gráficos num mesmo sistema de eixos
            line([a a],[-25 25],'Color','red','LineStyle','-');
            %plot(a,0,'ro');
        end
        if(drawPb)
            hold on; % para sobrepor gráficos num mesmo sistema de eixos
            line([b b],[-25 25],'Color','red','LineStyle','-');
            %%plot(b,0,'ro');
            
            if(strcmp(metodo,'radioTg'))
                f = FRvr(get(handles.editF,'String'));
                df   = diff(f(sym('x')),2);
                df_dx   = @(x) eval(vectorize(char(df)));
                fplot(df_dx,[a b]);
            end
        end 
   
    if(strcmp(metodo,'radioTg') || strcmp(metodo,'radioFp') || strcmp(metodo,'radioSe'))
        if(drawX0)
            y = [-25 25];
            x0 = str2num(get(handles.editEqX0,'String'));
            plot(x0,0,'bo');
            line([x0 x0],y,'Color','red','LineStyle','--');
        end
    end
    
    if(drawX1 &&  strcmp(metodo,'radioSe'))
        y = [-25 25];
        x1 = str2num(get(handles.editEqX1,'String'));
        plot(x1,0,'bo');
        line([x1 x1],y,'Color','red','LineStyle','--');
    end
        
end

