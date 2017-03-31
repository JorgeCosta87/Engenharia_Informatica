% Script de teste do Método das Tangentes ou de Newton/Raphson
% Método Numérico para resolução de equações não lineares f(x)=0
% 17/03/2010 - Arménio Correia .: armenioc@isec.pt 
% 18/03/2010 - João Pedro Alves .: jpalves@isec.pt

clc
clear


disp('MÉTODO DAS TANGENTES para a resolução de equações não lineares f(x)=0')
disp('')

f       = input ('f(x)= ', 's');
df_dx   = diff(f);     % 1ª Derivada da função introduzida
df2_dx2 = diff(df_dx); % 2ª Derivada da função introduzida

ff       = @(x) eval(vectorize(f));
dff_dx   = @(x) eval(vectorize(char(df_dx)));
dff2_dx2 = @(x) eval(vectorize(char(df2_dx2)));

ezplot(ff); % Gráfico da função f(x)
pause(2);

% Entrada dos parâmetros com protecções e validação de algumas das
% condições de convergência
while (1)
    while(1)
        a   = input ('Introduza o extremo do intervalo [a, b] » a = ','s');
        a = str2num(a);
        if(~isempty(a)) break; end
    end
    
    while(1)
        b   = input ('Introduza o extremo do intervalo [a, b] » b = ','s');
        b = str2num(b);
        if(~isempty(b)) break; end
    end 
    if (ff(a)*ff(b) < 0) break; 
    else disp('A raiz não pertence ao intervalo [a, b]')
    end
end

while (1)
    while(1)
        x0   = input ('Introduza a aproximação inicial » x0 =  ','s');
        x0 = str2num(x0);
        if(~isempty(x0)) break; end
    end
    if (ff(x0)*dff2_dx2(x0) > 0) break; end
end

while(1)
    while(1)
        kmax = input ('Introduza o número máximo de iterações » kmax = ','s');
        kmax = str2num(kmax);
        if(~isempty(kmax)) break; end
    end
    if(mod(kmax,1)==0 && kmax > 0) break; end % forçar o kmax a ser um inteiro
end
while(1)
    tol  = input ('Introduza a amplitude do intervalo(Tolerancia)» tol = ','s');
    tol = str2num(tol);
    if(~isempty(tol)) break; end
end

[x_mT, erro] = mTangentes_v2(ff,dff_dx,x0,kmax,tol);

disp(' ')
disp('AS APROXIMAÇÕES OBTIDAS SÃO:')
fprintf('\ni \t Aproximação\t Erro\n')
for i = 1:length(x_mT)
    if(i==1) fprintf('%d\t %.4f \n',i-1,x_mT(i));
    else fprintf('%d\t %.4f \t \t %.4f\n',i-1,x_mT(i),erro(i-1)); 
    end
end


x = a:0.01:b;  % domínio discreto x
y = ff(x);      % calcula as imagens de x pela função f

shg            % show graph window - trazer a janela de plot para a frente
plot(x,y)
hold on        % para sobrepor gráficos num mesmo sistema de eixos
plot(x,zeros(length(x)),'k')  % esboçar o eixo dos xx
plot(x_mT(end),ff(x_mT(end)),'or')% marcar a última aproximação
xlabel('x')    % legenda para o eixo dos xx
ylabel('y')    % legenda para o eixo dos yy
title(['Determinação da raiz da equação f(x)=0 \Leftrightarrow ' ...
        char(f) ' = 0'])
text(x_mT(end),ff(x_mT(end)), num2str(x_mT(end)));
hold off       % libertar o sistema de eixos 




