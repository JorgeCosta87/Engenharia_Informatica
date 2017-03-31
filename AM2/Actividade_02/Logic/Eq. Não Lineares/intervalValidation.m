%Descrição:
%
%
%
%Intput
%
%
%Output
% 0 - OK
% 1 - a não é um número real
% 2 - b não é um número real
% 3 - a > b
% 4 - Condição não cumprida f(a) * f(b) < 0
%

function value=intervalValidation(f, a, b)
    
    if(~(isscalar(a) && isreal(a)))
        value = 1;
    elseif(~(isscalar(b) && isreal(b)))
        value = 2;
    elseif(a > b)
       value = 3; 
    elseif (f(a) * f(b) < 0)
        value = 0;
    else
        value = 4;
   end  
end