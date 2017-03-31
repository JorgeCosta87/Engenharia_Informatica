%%Script de teste do M�todo das Tangentes ou de Newton-Raphson
% M�todo Num�rico para resolu��o de equa��es n�o lineares f(x)=0
% Chamada de fun��es: mTangentes e diff da Symbolic Math Toolbox
%
% 07/03/2016 - Arm�nio Correia  .: armenioc@isec.pt 
%%
clear 
clc

fprintf('--------------M�TODO DAS TANGENTES--------------\n')
strF = input('f(x)=','s');
a = str2num(input('a=','s'));
b = str2num(input('b=','s'));

%% fun��o, 1� e 2� derivada da fun��o
f       = @(x) eval(vectorize(strF));
symdf   = diff(f(sym('x'))); % Derivada_simb�lica
df_dx   = @(x) eval(vectorize(char(symdf)));
d2f_dx2 = @(x) eval(vectorize(char(diff(symdf))));

% Entrada dos par�metros com prote��es e valida��o de uma
% condi��es de converg�ncia
while(1)
    x0 = str2num(input('x0=','s'));
    if(f(x0)*d2f_dx2(x0)>0) break; end
end
k_max = str2num(input('k_max=','s'));
tol   = str2num(input('tol=','s'));

%% chamada do m�todo das tangentes
xT = MTangentes(f,df_dx,x0,k_max,tol);

fprintf('\n k \t\t x(k)\n');
for k=1:length(xT)
    fprintf('%d \t %.4f\n',k-1,xT(k));
end

%% gr�ficos
x=a:0.01:b;   % dom�nio discreto x
plot(x,f(x))  % gr�fico de y=f(x)
hold on       % para sobrepor gr�ficos num mesmo sistema de eixos
plot(x,zeros(length(x)))% esbo�ar o eixo dos xx
plot(xT(end),f(xT(end)),'or')% marcar a �ltima aproxima��o
hold off      % libertar o sistema de eixos 
xlabel('x')   % legenda para o eixo dos xx
ylabel('y')   % legenda para o eixo dos yy
title('M�todo das tangentes') % titulo para o gr�fico
text(xT(end),1,num2str(xT(end)))
