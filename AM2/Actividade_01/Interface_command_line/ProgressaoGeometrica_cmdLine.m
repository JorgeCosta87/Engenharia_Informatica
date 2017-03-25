%PROGRESSAOAGEOMETRICA_INTERFACE_v1 
%   r    = (ai) / (ai - 1) i = 1,...,n
%   a(n) = a(1) * r^(i - 1)  
%   S(n) = a1 * ( (r^n - 1) / r - 1)
%   
%   Autor: Jorge Costa : a21250797@alunos.isec.pt
%
%   Implementada com base na interface providenciada pelo professor:
%       Arm�nioCorreia .: armenioc@isec.pt

clear;
opcao = 1;
a = [];
while opcao ~= 3 
    clc;
    disp('PROGRESS�O Aritm�tica');
    disp(' ');
    fprintf('1. Gerar uma Progress�o Geom�trica\n'); 
    fprintf('2. Somar os elementos de uma Progress�o Geom�trica\n');
    fprintf('3. Terminar\n\n');
    opcao = input('Op��o: ');
    switch opcao
        case 1
            a_1 = input('Primeiro Elemento da PG: ');
              r = input('Raz�o da PG: ');
              n = input('N�mero de Elementos da PG: ');
              a = gerarPGeometrica_v4(a_1,r,n);
              disp(' ');
              disp('A Progress�o Geom�trica gerada �:');
              disp(' ');
              disp(a);
              disp(' ');
			  input('Prima uma tecla para continuar ...');
        case 2
            if(~isempty(a))
                S = SomaPGeometrica(a);
                fprintf('\nA soma dos elementos da PG introduzida �: %.1f\n',S);
            else
                disp('Come�e por introduzir a Progress�o geom�trica')
            end
            disp(' ');
            input('Prima uma tecla para continuar ...');
        case 3
            CmdLineInterface_PA_PG();
    end
end
    