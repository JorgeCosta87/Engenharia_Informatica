%SOMAPARITMETICA Soma dos elementos de uma Progressão Aritmética(PA)
%   a = SomaPAritmetica(a)
%   S(n) = (a(1)+a(n))/2*n  
%
%INPUT:
%   a - vector com os elementos da PA
%OUTPUT: 
%   S - Soma dos elementos da Progressão Aritmética
%   S(n) = (a(1)+a(n))/2*n
%
%   16/10/2012 - ArménioCorreia .: armenioc@isec.pt
%              - JoãoPedroAlves .: jpalves@isec.pt

function S = SomaPAritmetica(a)
n = length(a); % número de elementos da PA
S = ((a(1)+a(n))/2)*n;
end