% NDerivacaoDFP_3PTO Derivação Numérica - fórmula das diferenças
% progressivas em 3 pontos
% Formúla das Diferenças progressivas em 3 pontos
% f'(xi)= ( -3*f(x(i)) + 4*f(x(i)+1)-f(x(i+2)) )/(2*h) 
% INPUT:  f - função
%         [a, b] - intervalo de derivação
%         h - passo da discretização
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f 
%
%   Daniel Oliveira   21230554 - danielco94@gmail.com	
%   Jorge Costa       21250797 - jorgemdcosta@gmail.com
%   Ricardo Silva     21120616 - ricardojvsilva10@gmail.com
% 
% Data: Maio de 2017

function [x,y,dydx]=NDerivacaoDFP_3PTO(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end;
dydx=zeros(1,n);
for i=1:n-2
    dydx(i) = ( -3*y(i) + 4*y(i+1) - y(i+2) )/( 2*h );
end;

dydx(n-1) = ( -3*y(i) + 4*y(i+1) - y(i+2) )/( 2*h );
dydx(n)   = ( -3*y(i) + 4*y(i+1) - y(i+2) )/( 2*h ); 