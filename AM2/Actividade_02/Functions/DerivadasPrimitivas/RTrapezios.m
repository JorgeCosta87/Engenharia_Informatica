%RTRAPEZIOS:
% Permite obter um valor aproximado para o integral definido
% usando a regra dos trapézios composta.
%
%INPUT:
%   f - Função de x
%   a - Limite inferior do integral definido
%   b - Limite superior do integral definido
%   n - Número de iterações
%
%OUTPUT: 
%   T = Valor aproximado para o integral definido
%
%   Daniel Oliveira   21230554 - danielco94@gmail.com	
%   Jorge Costa       21250797 - jorgemdcosta@gmail.com
%   Ricardo Silva     21120616 - ricardojvsilva10@gmail.com
% 
% Data: Maio de 2017

function T=RTrapezios(f,a,b,n)
h=(b-a)/n;
x=a;
s=0;
for i=1:(n-1)
    x=x+h;
    s=s+f(x);
end
T=h/2*(f(a)+2*s+f(b));