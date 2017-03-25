%SCRIPT DE TESTE SOBRE A PROGRESSÃO GEOMÉTRICA
%
%   Implementada com base na interface providenciada pelo professor:
%       ArménioCorreia .: armenioc@isec.pt


clear;
clc;

a_1 = 1;     % 1.º elemento da PA
r   = 2;     % razão da PA
n   = 10000; % número de elementos da PA

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
