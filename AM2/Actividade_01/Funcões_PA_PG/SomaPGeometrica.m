%SomaPGeometrica Soma dos elementos de uma Progressão Geométrica(PG)
%
%   a = SomaPGeometrica(a)  
%
%INPUT:
%   a - vector com os elementos da PG
%OUTPUT: 
%   S - Soma dos elementos da Progressão Aritmética
%
%
%    S(n) = a(1) * ((r^n - 1) / (r - 1));

function S = SomaPGeometrica(a)
n = length(a);
r = a(2) / a(1);
S = a(1) * ((r^n - 1) / (r - 1));
end