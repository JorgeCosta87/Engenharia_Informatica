%MFalsaPos M�todo das FalsaPosi��o
%   x = MFalsaPos(handles, f,a,b,,kmax,tol,mode)
%   x(k+1) = ( a*f(b)-b*f(a) ) / ( f(b)-f(a) ), k = 0,1,2 
%INPUT:
%   handles - handles dos objectos da GUI
%   f - fun��o da equa��o n�o linear f(x)=0
%   a - Intervalo inferior
%   b - Intervalo superior
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%   mode - modo de apresenta��o da aproxima��o
%OUTPUT: 
%   x - vetor das aproxima��es
%   k - N�mero de itera��es
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
