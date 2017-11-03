% NDerivacaoDFP_3cTO Derivação Numérica - fórmula das diferenças
% centradas em 3 pontos
% Formúla das Diferenças centradas em 3 pontos
% f'(xi)= ( f(x(i+1)) - f(x(i-1)) )/( 2*h )   
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

function [x,y,dydx]=NDerivacaoDFC_3PTO(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end;
dydx=zeros(1,n);

dydx(1) = ( y(3) - y(1) )/( 2*h ); 

for i=2:n-1
    dydx(i) = ( y(i+1) - y(i-1) )/( 2*h );
end;

dydx(n) = ( y(i+1) - y(i-1) )/( 2*h ); 