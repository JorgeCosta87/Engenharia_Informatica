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

a_1 = 1; % 1.º elemento da PA
r   = 1; % razão da PA
n   = 5; % número de elementos da PA

disp('--------------------------------');
disp(' Progressão Aritmética versão 1 ');
disp('--------------------------------')
a = gerarPAritmetica_v1(a_1,r,n);
disp(a);

disp('--------------------------------');
disp(' Progressão Aritmética versão 2 ');
disp('--------------------------------')
b = gerarPAritmetica_v2(a_1,r,n);
disp(b);

disp('--------------------------------');
disp(' Progressão Aritmética versão 3 ');
disp('--------------------------------')
c = gerarPAritmetica_v3(a_1,r,n);
disp(c);

disp('--------------------------------');
disp(' Progressão Aritmética versão 4 ');
disp('--------------------------------')
d = gerarPAritmetica_v4(a_1,r,n);
fprintf('%g\n',d);

disp('---------------------------------------------');
disp(' Soma dos elementos da Progressão Aritmética ');
disp('---------------------------------------------');
S = SomaPAritmetica(d);
fprintf('A soma dos elementos da PA é: %.1f\n\n',S)