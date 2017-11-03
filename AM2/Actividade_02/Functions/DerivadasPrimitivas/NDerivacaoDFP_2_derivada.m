% NDerivacaoDFP_2_derivada Deriva��o Num�rica - f�rmula da segunda derivada em 3 pontos
% Form�la da segunda derivada em 3 pontos
% f'(xi)= ( f(x(i+1)) - 2*f(x(i)) + f(x(i-1)) )/( 2*h )  
% INPUT:  f - fun��o
%         [a, b] - intervalo de deriva��o
%         h - passo da discretiza��o
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f 
%
%   Daniel Oliveira   21230554 - danielco94@gmail.com	
%   Jorge Costa       21250797 - jorgemdcosta@gmail.com
%   Ricardo Silva     21120616 - ricardojvsilva10@gmail.com
% 
% Data: Maio de 2017

function [x,y,dydx]=NDerivacaoDFP_2_derivada(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end;
dydx=zeros(1,n);

dydx(1) = ( y(3) - 2*y(2) + y(1) )/( h*h );

for i=2:n-1
    dydx(i) = ( y(i+1) - 2*y(i) + y(i - 1) )/( h*h );
end;
 dydx(n) = ( y(i+1) - 2*y(i) + y(i - 1) )/( h*h );