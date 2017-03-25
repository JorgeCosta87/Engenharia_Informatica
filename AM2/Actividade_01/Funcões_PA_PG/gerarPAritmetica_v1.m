function a = gerarPAritmetica_v1(a_1,r,n)
%GERARPARITMENTICA_v1 Gerar uma Progressão Aritmética(PA
%   a = ProgressaoAritmetica(a_1,r,n)
%   a(n) = a(1)+(n-1)*r  
%
%INPUT:
%   a_1 - primeiro elemento da progressaão aritmética
%   r - razão da progressão aritmética
%   n - número de elementos da progressão aritmética 
%OUTPUT: 
%   a - vector com os elementos da progressão aritmética
%   a(i) = a(1)+(i-1)*r , i=2,...,n
%
%   16/10/2012 - ArménioCorreia .: armenioc@isec.pt
%              - JoãoPedroAlves .: jpalves@isec.pt

a(1) = a_1;  % inicialização do vector da PA
for i=2:n    % intervalo de iteração
    a(i) = a(1)+(i-1)*r; % equação de iteração da PA
end