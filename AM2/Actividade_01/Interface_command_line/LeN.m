%LeN Ler e validar o valor de n introduzido pelo utilizador
%   n = LeN(str)
%   n é um número inteiro positivo e maior do que 2
%
%INPUT:
%   str - mensagem para utilizador a pedir o valor de n
%OUTPUT: 
%   n - número de elementos da Progressão
%
%   24/10/2012 - ArménioCorreia .: armenioc@isec.pt 

function n = LeN(str)
while (1)
    strN = input(str,'s');
    n    = str2num(strN);
    if (~isscalar(n))
        disp('Introduza um número inteiro maior do que 2');
        continue;
    end;
    if (n==floor(n) && n > 2)
        break;
    end
end