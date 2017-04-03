%MFalsaPos Método das FalsaPosição
%   x = MFalsaPos(handles, f,a,b,,kmax,tol,mode)
%   x(k+1) = ( a*f(b)-b*f(a) ) / ( f(b)-f(a) ), k = 0,1,2 
%INPUT:
%   handles - handles dos objectos da GUI
%   f - função da equação não linear f(x)=0
%   a - Intervalo inferior
%   b - Intervalo superior
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%   mode - modo de apresentação da aproximação
%OUTPUT: 
%   x - vetor das aproximações
%   k - Número de iterações
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function [x, k] = MFalsaPos(handles,f,a,b,kmax,tol,mode)

    x(1) = ( a*f(b)-b*f(a) ) / ( f(b)-f(a) ); 

    for k = 1 : kmax

        if f(a)*f(x(k))<0
            b=x(k);
        else
            a=x(k);
        end

        x(k+1) = ( a*f(b)-b*f(a) ) / ( f(b)-f(a) ); 

        set(handles.textEqShowAprox,'String',x(k+1));
        plot(x(k+1),0,'ro');

        if(abs(x(k+1)-x(k)) < tol * abs(x(k+1)))
            return 
        end;  

        %Define o comportamento com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
end
