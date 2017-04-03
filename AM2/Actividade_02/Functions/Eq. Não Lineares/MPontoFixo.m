%MPontoFixo M�todo das PontoFixo
%   x = MPontoFixo(handles,f,x0,kmax,tol,mode)
%   x(k+1) = g(x(k)); 
%INPUT:
%   handles - handles dos objectos da GUI
%   f - fun��o da equa��o n�o linear f(x)=0
%   x0 - aproxima��o inicial \in [a, b]: f(x0)*f''(x0)>0
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%   mode - modo de apresenta��o da aproxima��o
%OUTPUT: 
%   x - vetor das aproxima��es
%   k - N�mero de itera��es 
%
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 


function [x, k] = MPontoFixo(handles,g,x0,kmax,tol,mode)
    k=1;
    x(k) = x0;

    while(k <=kmax)
    
        x(k+1) = g(x(k));

        set(handles.textEqShowAprox,'String',x(k+1));
        plot(x(k),0,'ro');

        if(abs(x(k+1)-x(k))<tol)
            break; 
        end;  

        k=k+1;

        %Define o comportamento com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
end
