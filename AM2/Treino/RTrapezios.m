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
%   05/04/2016 - Daniel Cardoso Oliveira .: danielco94@gmail.com

function T=RTrapezios(f,a,b,n)
h=(b-a)/n;
x=a;
s=0;
for i=1:(n-1)
    x=x+h;
    s=s+f(x);
end
T=h/2*(f(a)+2*s+f(b));