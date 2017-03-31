%%Script de teste do Método das Tangentes ou de Newton-Raphson
% Método Numérico para resolução de equações não lineares f(x)=0
% Chamada de funções: mTangentes e diff da Symbolic Math Toolbox

% AULA P
% 17/03/2012 - João Pedro Alves .: jpalves@isec.pt
% 17/03/2012 - Arménio Correia  .: armenioc@isec.pt 
%%
clear 
clc

disp('MÉTODO DAS TANGENTES')
disp('')

strF = input('f(x)=','s');
a = input('a=');
b = input('b=');

%% função, 1ª e 2ª derivada da função
f       = @(x) eval(vectorize(strF));
symdf   = diff(f(sym('x'))); % Derivada_simbólica
df_dx   = @(x) eval(vectorize(char(symdf)));
d2f_dx2 = @(x) eval(vectorize(char(diff(symdf))));

% Entrada dos parâmetros com proteções e validação de uma
% condições de convergência
while(1)
    x0    = input('x0=');
    if(f(x0)*d2f_dx2(x0) > 0) break; end
end
k_max = input('k_max=');
tol   = input('tol=');

% chamada do método das tangentes
x_mT = mTangentes(f,df_dx,x0,k_max,tol)

%% gráficos
x=a:0.01:b;   % domínio discreto x
plot(x,f(x))  % gráfico de y=f(x)
hold on       % para sobrepor gráficos num mesmo sistema de eixos
plot(x,zeros(length(x)))% esboçar o eixo dos xx
plot(x_mT(end),f(x_mT(end)),'or')% marcar a última aproximação
hold off      % libertar o sistema de eixos 
xlabel('x')   % legenda para o eixo dos xx
ylabel('y')   % legenda para o eixo dos yy
title('Método das tangentes') % titulo para o gráfico
text(x_mT(end),1,num2str(x_mT(end)))
