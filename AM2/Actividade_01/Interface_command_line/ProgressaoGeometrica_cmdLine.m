%PROGRESSAOAGEOMETRICA_INTERFACE_v1 
%   r    = (ai) / (ai - 1) i = 1,...,n
%   a(n) = a(1) * r^(i - 1)  
%   S(n) = a1 * ( (r^n - 1) / r - 1)
%   
%   Autor: Jorge Costa : a21250797@alunos.isec.pt
%
%   Implementada com base na interface providenciada pelo professor:
%       ArménioCorreia .: armenioc@isec.pt

clear;
opcao = 1;
a = [];
while opcao ~= 3 
    clc;
    disp('PROGRESSÃO Aritmética');
    disp(' ');
    fprintf('1. Gerar uma Progressão Geométrica\n'); 
    fprintf('2. Somar os elementos de uma Progressão Geométrica\n');
    fprintf('3. Terminar\n\n');
    opcao = input('Opção: ');
    switch opcao
        case 1
            a_1 = input('Primeiro Elemento da PG: ');
              r = input('Razão da PG: ');
              n = input('Número de Elementos da PG: ');
              a = gerarPGeometrica_v4(a_1,r,n);
              disp(' ');
              disp('A Progressão Geométrica gerada é:');
              disp(' ');
              disp(a);
              disp(' ');
			  input('Prima uma tecla para continuar ...');
        case 2
            if(~isempty(a))
                S = SomaPGeometrica(a);
                fprintf('\nA soma dos elementos da PG introduzida é: %.1f\n',S);
            else
                disp('Começe por introduzir a Progressão geométrica')
            end
            disp(' ');
            input('Prima uma tecla para continuar ...');
        case 3
            CmdLineInterface_PA_PG();
    end
end
    