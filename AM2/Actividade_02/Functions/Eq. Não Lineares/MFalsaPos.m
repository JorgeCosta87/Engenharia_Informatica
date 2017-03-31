function x = MPontoFixo(handles,f,a,b,kmax,tol,mode)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


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
%Guarda a iteração
x(2,1) = k;
end
