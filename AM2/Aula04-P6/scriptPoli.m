%script de teste para calculo de valores polinomiais
clear 
clc

%P = input('p=','s');
P = '3*x^2+x^2+3';

%colocar validação em termos de ter sido introduzida
%uma função x no formato ponomial

P = @(x)eval(vectorize(P));
%P = P(sym('x'));

t = 1:0.01:1000000;
length(t) % grau igual a length(a) - 1;

%tic
%P(t);
%toc

tic 
polyval([3 1 0 3],t); % pol P = 3x^2+x^2+3
toc

tic 
PHorner([3 1 0 3],t);
toc