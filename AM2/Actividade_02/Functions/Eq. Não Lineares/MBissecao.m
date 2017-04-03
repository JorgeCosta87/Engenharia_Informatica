%MBissecao M�todo das Bissecao
%   x = MBissecao(handles,f,a,b,kmax,tol,mode)
%   x(k) = (a+b)/2, k = 0,1,2 
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
%   k - n�mero de itera��es
%   
%   07/03/2016 - Arm�nioCorreia .: armenioc@isec.pt
%   Adaptado por:
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function [x, k] =MBissecao(handles, f, a, b, kmax, tol, mode)
    
    x = [];

    for k=1 : kmax
        
        x(k)=(a+b)/2;
        %Marca o ponto da nova aproxima��o
        plot(x(k),0,'ro');
        
        %Actualiza o valor da aproxima��o na GUI
        set(handles.textEqShowAprox,'String',x(k));

        if (f(x(k))==0)
            break
        elseif(isscalar(tol) && tol > 0 &&  abs(b-a)/2<tol)
            break
        end
        if f(a)*f(x(k))<0
            b=x(k);
        else
            a=x(k);
        end
        
        %zoom in
        % if(mod(k,5) == 0)
        %     xlim([a-1 b+1]);
        % end

        %Modo com � apresentada a aproxima��o
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
end