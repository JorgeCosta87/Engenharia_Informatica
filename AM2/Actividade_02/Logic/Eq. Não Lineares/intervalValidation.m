%Descri��o:
%
%
%
%Intput
%
%
%Output
% 0 - OK
% 1 - a n�o � um n�mero real
% 2 - b n�o � um n�mero real
% 3 - a > b
% 4 - Condi��o n�o cumprida f(a) * f(b) < 0
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