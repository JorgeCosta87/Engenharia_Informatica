%%Script de teste do Método das Tangentes ou de Newton-Raphson
% Método Numérico para resolução de equações não lineares f(x)=0
% Chamada de funções: mTangentes e diff da Symbolic Math Toolbox
%
% 07/03/2016 - Arménio Correia  .: armenioc@isec.pt 
%%
clear 
clc

fprintf('--------------MÉTODO DAS TANGENTES--------------\n')
strF = input('f(x)=','s');
a = str2num(input('a=','s'));
b = str2num(input('b=','s'));

%% função, 1ª e 2ª derivada da função
f       = @(x) eval(vectorize(strF));
symdf   = diff(f(sym('x'))); % Derivada_simbólica
df_dx   = @(x) eval(vectorize(char(symdf)));
d2f_dx2 = @(x) eval(vectorize(char(diff(symdf))));

% Entrada dos parâmetros com proteções e validação de uma
% condições de convergência
while(1)
    x0 = str2num(input('x0=','s'));
    if(f(x0)*d2f_dx2(x0)>0) break; end
end
k_max = str2num(input('k_max=','s'));
tol   = str2num(input('tol=','s'));

%% chamada do método das tangentes
xT = MTangentes(f,df_dx,x0,k_max,tol);

fprintf('\n k \t\t x(k)\n');
for k=1:length(xT)
    fprintf('%d \t %.4f\n',k-1,xT(k));
end

%% gráficos
x=a:0.01:b;   % domínio discreto x
plot(x,f(x))  % gráfico de y=f(x)
hold on       % para sobrepor gráficos num mesmo sistema de eixos
plot(x,zeros(length(x)))% esboçar o eixo dos xx
plot(xT(end),f(xT(end)),'or')% marcar a última aproximação
hold off      % libertar o sistema de eixos 
xlabel('x')   % legenda para o eixo dos xx
ylabel('y')   % legenda para o eixo dos yy
title('Método das tangentes') % titulo para o gráfico
text(xT(end),1,num2str(xT(end)))
