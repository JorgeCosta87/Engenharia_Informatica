%MPontoFixo Método das PontoFixo
%   x = MPontoFixo(handles,f,x0,kmax,tol,mode)
%   x(k+1) = g(x(k)); 
%INPUT:
%   handles - handles dos objectos da GUI
%   f - função da equação não linear f(x)=0
%   x0 - aproximação inicial \in [a, b]: f(x0)*f''(x0)>0
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%   mode - modo de apresentação da aproximação
%OUTPUT: 
%   x - vetor das aproximações
%   k - Número de iterações 
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
