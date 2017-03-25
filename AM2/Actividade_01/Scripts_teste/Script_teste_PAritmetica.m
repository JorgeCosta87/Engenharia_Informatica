%SCRIPT DE TESTE SOBRE A PROGRESS�O ARITM�TICA
%   r    = a(i)-a(i-1) , i=1..n 
%   a(n) = a(1)+(n-1)*r  
%   S(n) = (a(1)+a(n))/2*n
%
%Chamada de SUB-FUN��ES
%   gerarPAritmetica_{v1,v2,v3,v4} - Gerar uma Progress�o Aritm�tica
%   SomaPAritmetica - Soma dos n primeiros elementos de uma PA
%
%   16/10/2012 - Arm�nioCorreia .: armenioc@isec.pt 

clear;
clc;

a_1 = 1; % 1.� elemento da PA
r   = 1; % raz�o da PA
n   = 5; % n�mero de elementos da PA

disp('--------------------------------');
disp(' Progress�o Aritm�tica vers�o 1 ');
disp('--------------------------------')
a = gerarPAritmetica_v1(a_1,r,n);
disp(a);

disp('--------------------------------');
disp(' Progress�o Aritm�tica vers�o 2 ');
disp('--------------------------------')
b = gerarPAritmetica_v2(a_1,r,n);
disp(b);

disp('--------------------------------');
disp(' Progress�o Aritm�tica vers�o 3 ');
disp('--------------------------------')
c = gerarPAritmetica_v3(a_1,r,n);
disp(c);

disp('--------------------------------');
disp(' Progress�o Aritm�tica vers�o 4 ');
disp('--------------------------------')
d = gerarPAritmetica_v4(a_1,r,n);
fprintf('%g\n',d);

disp('---------------------------------------------');
disp(' Soma dos elementos da Progress�o Aritm�tica ');
disp('---------------------------------------------');
S = SomaPAritmetica(d);
fprintf('A soma dos elementos da PA �: %.1f\n\n',S)