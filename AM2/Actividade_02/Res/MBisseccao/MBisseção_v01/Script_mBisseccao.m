% Script de teste do Método da Bissecção
% Método Numérico para resolução de equações não lineares f(x)=0
% 02/12/09 - ArménioCorreia .: armenioc@isec.pt 

clc
clear

% Definição da função de teste
% function handle
f = @(x) abs(x)-exp(x)
f(-1)
f(0)

c = mBisseccao(f,-1,0,3,0.01) 

% function inline
f = inline('abs(x)-exp(x)')
f(-1)
f(0)

c = mBisseccao(f,-1,0,3,0.01)

% function externa (fteste01)
fa = fteste01(-1)
fb = fteste01(0)

% chamada da função f através de uma handle
c = mBisseccao(@fteste01,-1,0,3,0.01)

% entrada da função f como string
c = mBisseccao('fteste01',-1,0,3,0.01)

x = mBisseccao_v2('fteste01',-1,0,3,0.01)
