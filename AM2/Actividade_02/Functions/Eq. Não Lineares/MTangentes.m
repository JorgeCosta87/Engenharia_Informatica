%MTangentes M�todo das Tangentes
%   x = mTangentes(f,df_dx,a,b,kmax,tol)
%   x(k+1) = x(k)-f(x(k))/f'(x(k)), k = 0,1,2 
%INPUT:
%   f - fun��o da equa��o n�o linear f(x)=0
%   df_dx - derivada da fun��o f'(x)
%   x0 - aproxima��o inicial \in [a, b]: f(x0)*f''(x0)>0
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%OUTPUT: 
%   x - vetor das aproxima��es
%
%   07/03/2016 - Arm�nioCorreia .: armenioc@isec.pt

function x = MTangentes(handles,f,df_dx,x0,kmax,tol,mode) 

    x(1)=x0;
    for k=1 : kmax
        
       x(k+1)=x(k)-f(x(k))/df_dx(x(k));
       
       
       %Mostra a presente aproxima��o
       %set(handles.textEqShowAprox,'String',x(k+1));
       %df   = diff(f(sym('x')));
       %df_dx   = @(x) eval(vectorize(char(df)));
        
       %fplot(df_dx,[-25 25]);
       
       plot(x(k+1),0,'ro');

       if(abs(x(k+1)-x(k))<tol) 
           break;
       end;  
       
       %Define o comportamento da ac��o com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
    
    %Guarda a itera��o
    x(2,1) = k;
