%LeN Ler e validar o valor de n introduzido pelo utilizador
%   n = LeN(str)
%   n � um n�mero inteiro positivo e maior do que 2
%
%INPUT:
%   str - mensagem para utilizador a pedir o valor de n
%OUTPUT: 
%   n - n�mero de elementos da Progress�o
%
%   24/10/2012 - Arm�nioCorreia .: armenioc@isec.pt 

function n = LeN(str)
while (1)
    strN = input(str,'s');
    n    = str2num(strN);
    if (~isscalar(n))
        disp('Introduza um n�mero inteiro maior do que 2');
        continue;
    end;
    if (n==floor(n) && n > 2)
        break;
    end
end