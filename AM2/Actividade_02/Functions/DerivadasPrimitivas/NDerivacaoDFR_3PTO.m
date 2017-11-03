% NDerivacaoDFR_3PTO Derivação Numérica - fórmula das diferenças
% regressivas em 3 pontos
% Formúla das Diferenças regressivas em 3 pontos
% f'(xi)= (f(x(i-2)-4*f(x(i-1))+3*f(x(i)))/(2h)   
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

function [x,y,dydx]=NDerivacaoDFR_3PTO(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end;
dydx=zeros(1,n);

dydx(1)= (y(1)-4*y(2)+3*y(3)) / (2*h);
dydx(2)= (y(1)-4*y(2)+3*y(3)) / (2*h);

for i=3:n
    dydx(i)= (y(i-2)-4*y(i-1)+3*y(i)) / (2*h);
end;
%dydx(n)=(y(n-2)-4*y(n-1)+3*f(n)) / (2*h); 