%SOMAPARITMETICA Soma dos elementos de uma Progress�o Aritm�tica(PA)
%   a = SomaPAritmetica(a)
%   S(n) = (a(1)+a(n))/2*n  
%
%INPUT:
%   a - vector com os elementos da PA
%OUTPUT: 
%   S - Soma dos elementos da Progress�o Aritm�tica
%   S(n) = (a(1)+a(n))/2*n
%
%   16/10/2012 - Arm�nioCorreia .: armenioc@isec.pt
%              - Jo�oPedroAlves .: jpalves@isec.pt

function S = SomaPAritmetica(a)
n = length(a); % n�mero de elementos da PA
S = ((a(1)+a(n))/2)*n;
end