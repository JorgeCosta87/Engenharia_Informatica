%%Script de teste do M�todo das Tangentes ou de Newton-Raphson
% M�todo Num�rico para resolu��o de equa��es n�o lineares f(x)=0
% Chamada de fun��es: mTangentes e diff da Symbolic Math Toolbox

% AULA P
% 17/03/2012 - Jo�o Pedro Alves .: jpalves@isec.pt
% 17/03/2012 - Arm�nio Correia  .: armenioc@isec.pt 
%%
clear 
clc

disp('M�TODO DAS TANGENTES')
disp('')

strF = input('f(x)=','s');
a = input('a=');
b = input('b=');

%% fun��o, 1� e 2� derivada da fun��o
f       = @(x) eval(vectorize(strF));
symdf   = diff(f(sym('x'))); % Derivada_simb�lica
df_dx   = @(x) eval(vectorize(char(symdf)));
d2f_dx2 = @(x) eval(vectorize(char(diff(symdf))));

% Entrada dos par�metros com prote��es e valida��o de uma
% condi��es de converg�ncia
while(1)
    x0    = input('x0=');
    if(f(x0)*d2f_dx2(x0) > 0) break; end
end
k_max = input('k_max=');
tol   = input('tol=');

% chamada do m�todo das tangentes
x_mT = mTangentes(f,df_dx,x0,k_max,tol)

%% gr�ficos
x=a:0.01:b;   % dom�nio discreto x
plot(x,f(x))  % gr�fico de y=f(x)
hold on       % para sobrepor gr�ficos num mesmo sistema de eixos
plot(x,zeros(length(x)))% esbo�ar o eixo dos xx
plot(x_mT(end),f(x_mT(end)),'or')% marcar a �ltima aproxima��o
hold off      % libertar o sistema de eixos 
xlabel('x')   % legenda para o eixo dos xx
ylabel('y')   % legenda para o eixo dos yy
title('M�todo das tangentes') % titulo para o gr�fico
text(x_mT(end),1,num2str(x_mT(end)))
