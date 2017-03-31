% Script de teste do M�todo da Bissec��o
% M�todo Num�rico para resolu��o de equa��es n�o lineares f(x)=0
% 02/12/09 - Arm�nioCorreia .: armenioc@isec.pt 

clc
clear

% Defini��o da fun��o de teste
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

% chamada da fun��o f atrav�s de uma handle
c = mBisseccao(@fteste01,-1,0,3,0.01)

% entrada da fun��o f como string
c = mBisseccao('fteste01',-1,0,3,0.01)

x = mBisseccao_v2('fteste01',-1,0,3,0.01)
