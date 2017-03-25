%SCRIPT DE TESTE SOBRE A PROGRESS�O GEOM�TRICA
%
%   Implementada com base na interface providenciada pelo professor:
%       Arm�nioCorreia .: armenioc@isec.pt

clear;
clc;

a_1 = 1; % 1.� elemento da PG
r   = 2; % raz�o da PG
n   = 5; % n�mero de elementos da PG

disp('--------------------------------');
disp(' PG v1 ');
disp('--------------------------------')
a = gerarPGeometrica_v1(a_1,r,n);
disp(a);

disp('--------------------------------');
disp(' PG v2 ');
disp('--------------------------------')
b = gerarPGeometrica_v2(a_1,r,n);
disp(b);

disp('--------------------------------');
disp(' PG v3 ');
disp('--------------------------------')
c = gerarPGeometrica_v3(a_1,r,n);
disp(c);

disp('--------------------------------');
disp(' PG v4 ');
disp('--------------------------------')
d = gerarPGeometrica_v4(a_1,r,n);
disp(d);

disp('---------------------------------------------');
disp(' Soma dos elementos da Progress�o Geom�trica ');
disp('---------------------------------------------');
S = SomaPGeometrica(d);
fprintf('A soma dos elementos da PG �: %.1f\n\n',S)