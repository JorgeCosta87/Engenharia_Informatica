%Msecante Método das Secante
%   x = Msecante(handles,f,x0,x1,kmax,tol,mode)
%   x(k+1) = (x(k-1)*f(x(k))-x(k)*f(x(k-1))) / ((f(x(k)) - f(x(k-1))))
%INPUT:
%   handles - handles dos objectos da GUI
%   f - função da equação não linear f(x)=0
%   x0 - aproximação inicial I= [a, b]: f(x0)*f''(x0)>0
%   x1 - aproximação inicial I= [a, b]: f(x1)*f''(x1)>0
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%   mode - modo de apresentação da aproximação
%OUTPUT: 
%   x - vetor das aproximações
%   k - Número de iterações
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function [x, k] = Msecante(handles,f,x0,x1,kmax,tol,mode)

    k=2;
    x(k) = x1;
    x(k-1) = x0;

    while(k <=kmax + 1)

        x(k+1) = (x(k-1)*f(x(k))-x(k)*f(x(k-1))) / ((f(x(k)) - f(x(k-1))));

        %marca a nova aprox.
        plot(x(k+1),0,'ro');
        
        %mostra a secante no gráfico
        plot(x(k-1),f(x(k-1)), '*');
        plot(x(k),f(x(k)), '*');
        plot([x(k),x(k-1)], [f(x(k)),f(x(k-1))]);
        plot([x(k),x(k+1)], [f(x(k)),0]);
        
        %mostra a aprox. na ui
        set(handles.textEqShowAprox,'String',x(k+1));

        if(abs(x(k+1)-x(k))<tol)
            break; 
        end;  
        
        if(x(k+1) == x(k))
            break;
        end    
        
        k=k+1;

        %Define o comportamento com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
end
