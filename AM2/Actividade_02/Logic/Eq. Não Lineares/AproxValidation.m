%Descrição:
%
%
%
%Intput
%
%
%Output
% 0 - OK
% 1 - Não é um número real
% 2 - Fora do intervalo [a, b]
% 3 - Condição não cumprida f(x0) * f''(x0) > 0
%


function value = AproxValidation(handles,f,x,a,b)
       
    if(~(isscalar(x) && isreal(x)))
        value = 1;
        return
    end
    
    if((x < a) | (x > b))
        value = 2;
        return
    end
    
    symdf   = diff(f(sym('x'))); % Derivada simbólica
    d2f_dx2 = @(x) eval(vectorize(char(diff(symdf))));

    if ((f(x) * d2f_dx2(x)) > 0)
        value = 0;
    else
        value = 3;
    end
        
end

