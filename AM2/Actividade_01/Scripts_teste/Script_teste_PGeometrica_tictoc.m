%SCRIPT DE TESTE SOBRE A PROGRESS�O GEOM�TRICA
%
%   Implementada com base na interface providenciada pelo professor:
%       Arm�nioCorreia .: armenioc@isec.pt


clear;
clc;

a_1 = 1;     % 1.� elemento da PA
r   = 2;     % raz�o da PA
n   = 10000; % n�mero de elementos da PA

%%
tic
gerarPGeometrica_v1(a_1,r,n);
toc
%%
tic
gerarPGeometrica_v2(a_1,r,n);
toc
%%
tic
gerarPGeometrica_v3(a_1,r,n);
toc
%%
tic
gerarPGeometrica_v4(a_1,r,n);
toc
