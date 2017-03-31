function x = MPontoFixo(handles,f,x0,kmax,tol,mode)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

k=1;
x(k) = x0;

while(k <=kmax)
    
    x(k+1) = f(x(k));
    
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

%Guarda a iteração
if(k >= kmax)
    x(2,1) = kmax;
else
    x(2,1) = k;
end
