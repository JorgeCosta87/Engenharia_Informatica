%RSIMPSON:
% Permite obter um valor aproximado para o integral definido
% usando a regra de Simpson.
%
%INPUT:
%   f - Função de x
%   a - Limite inferior do integral definido
%   b - Limite superior do integral definido
%   n - Número de iterações
%
%OUTPUT: 
%   out_S = Valor aproximado para o integral definido
%
%   05/04/2016 - Daniel Cardoso Oliveira .: danielco94@gmail.com

function out_S=RSimpson(f,a,b,n)
h=(b-a)/n;
x=a;
s=0;
for i=1:n-1
    x=x+h;
    if(mod(i, 2) == 0)
       s = s + 2*f(x);
    else
       s = s + 4*f(x);
    end
end
out_S = h/3*(f(a)+s+f(b));