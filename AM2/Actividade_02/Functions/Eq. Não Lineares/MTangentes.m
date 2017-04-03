%MTangentes Método das Tangentes
%   x = mTangentes(handles,f,df_dx,a,b,kmax,tol)
%   x(k+1) = x(k)-f(x(k))/f'(x(k)), k = 0,1,2 
%INPUT:
%   handles - handles dos objectos da GUI
%   f - função da equação não linear f(x)=0
%   df_dx - derivada da função f'(x)
%   x0 - aproximação inicial \in [a, b]: f(x0)*f''(x0)>0
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%   mode - modo de apresentação da aproximação
%OUTPUT: 
%   x - vetor das aproximações
%   k - Número de iterações
%
%   07/03/2016 - ArménioCorreia .: armenioc@isec.pt
%   Adaptado por:
%   26/03/2017 - Jorge Costa    .: jorgemdcosta@gmail.com 

function [x, k] = MTangentes(handles,f,df_dx,x0,kmax,tol,mode) 

    x(1)=x0;
    for k=1 : kmax
        
       x(k+1)=x(k)-f(x(k))/df_dx(x(k));
       
       plot(x(k),f(x(k)), '*');
       plot(x(k+1),0 , '*');
       plot([x(k) x(k+1)], [f(x(k)),0]);
       %line(p0,p1);
       %Mostra a presente aproximação
       %set(handles.textEqShowAprox,'String',x(k+1));
       %df   = diff(f(sym('x')));
       %df_dx   = @(x) eval(vectorize(char(df)));
        
       %fplot(df_dx,[-25 25]);
       
       %plot(x(k+1),0,'ro');

       if(abs(x(k+1)-x(k))<tol) 
           break;
       end;  
       
       %Define o comportamento da acção com base no modo selecionado
        if(strcmp(mode,'radioEqAnim'))
            pause(1);
        elseif (strcmp(mode,'radioEqStep'))
            while(waitforbuttonpress == 1); end
        end
    end
end
