% Script de teste do M�todo das Tangentes ou de Newton/Raphson
% M�todo Num�rico para resolu��o de equa��es n�o lineares f(x)=0
% 17/03/2010 - Arm�nio Correia .: armenioc@isec.pt 

clc
clear


disp('M�TODO DAS TANGENTES para a resolu��o de equa��es n�o lineares f(x)=0')
disp('')

f       = input ('f(x)= ', 's');
df_dx   = diff(f);     % 1� Derivada da fun��o introduzida
df2_dx2 = diff(df_dx); % 2� Derivada da fun��o introduzida

ff       = @(x) eval(vectorize(f));
dff_dx   = @(x) eval(vectorize(char(df_dx)));
dff2_dx2 = @(x) eval(vectorize(char(df2_dx2)));

ezplot(ff); % Gr�fico da fun��o f(x)
pause(2);

while (1)
    a   = input ('Introduza o extremo do intervalo [a, b] � a = ');
    b   = input ('Introduza o extremo do intervalo [a, b] � b = ');
    if (ff(a)*ff(b) < 0) break; end
end

while (1)
    x0   = input ('Introduza a aproxima��o inicial � x0 =  ');
    if (ff(x0)*dff2_dx2(x0) > 0) break; end
end

kmax = input ('Introduza o n�mero m�ximo de itera��es � kmax = ');
tol  = input ('Introduza a amplitude do intervalo(Tolerancia)� tol = '); 

[x_mT, erro] = mTangentes_v2(ff,dff_dx,x0,kmax,tol);

disp(' ')
disp('AS APROXIMA��ES OBTIDAS S�O:')
fprintf('\ni \t Aproxima��o\t Erro\n')
for i = 1:length(x_mT)
    if(i==1) fprintf('%d\t %.4f \n',i-1,x_mT(i));
    else fprintf('%d\t %.4f \t \t %.4f\n',i-1,x_mT(i),erro(i-1)); 
    end
end


x = a:0.01:b;  % dom�nio discreto x
y = ff(x);      % calcula as imagens de x pela fun��o f

shg            % show graph window - trazer a janela de plot para a frente
plot(x,y)
hold on        % para sobrepor gr�ficos num mesmo sistema de eixos
plot(x,zeros(length(x)),'k')  % esbo�ar o eixo dos xx
plot(x_mT(end),ff(x_mT(end)),'or')% marcar a �ltima aproxima��o
xlabel('x')    % legenda para o eixo dos xx
ylabel('y')    % legenda para o eixo dos yy
title(['Determina��o da raiz da equa��o f(x)=0 \Leftrightarrow ' ...
        char(f) ' = 0'])
text(x_mT(end),ff(x_mT(end)), num2str(x_mT(end)));
hold off       % libertar o sistema de eixos 




