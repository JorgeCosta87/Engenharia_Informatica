%SCRIPT DE TESTE SOBRE A PROGRESSÃO ARITMÉTICA
%   r    = a(i)-a(i-1) , i=1..n 
%   a(n) = a(1)+(n-1)*r  
%   S(n) = (a(1)+a(n))/2*n
%
%Chamada de SUB-FUNÇÕES
%   gerarPAritmetica_{v1,v2,v3,v4} - Gerar uma Progressão Aritmética
%   SomaPAritmetica - Soma dos n primeiros elementos de uma PA
%
%   16/10/2012 - ArménioCorreia .: armenioc@isec.pt 

clear;
clc;

a_1 = 1;     % 1.º elemento da PA
r   = 1;     % razão da PA
n   = 10000; % número de elementos da PA

%%
tic
a = gerarPAritmetica_v1(a_1,r,n);
toc
%%
tic
b = gerarPAritmetica_v2(a_1,r,n);
toc
%%
tic
c = gerarPAritmetica_v3(a_1,r,n);
toc
%%
tic
a = gerarPAritmetica_v4(a_1,r,n);
toc
