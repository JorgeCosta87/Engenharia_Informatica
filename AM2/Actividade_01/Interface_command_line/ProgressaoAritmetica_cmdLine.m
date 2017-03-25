%PROGRESSAOARITMENTICA_INTERFACE_v1 
%   r    = a(i)-a(i-1) , i=1..n 
%   a(n) = a(1)+(n-1)*r  
%   S(n) = (a(1)+a(n))/2*n
%
%Chamada de SUB-FUNÇÕES
%   ProgressãoAritmética_v4 - Gerar uma Progressão Aritmética
%   SomaPAritmetica - Soma dos n primeiros elementos de uma PA
%
%   16/10/2012 - ArménioCorreia .: armenioc@isec.pt 

clear;
opcao = 1;
a = [];
while opcao ~= 3 
    clc;
    disp('PROGRESSÃO ARITMÉTICA');
    disp(' ');
    fprintf('1. Gerar uma Progressão Aritmética (PA)\n'); 
    fprintf('2. Somar os elementos de uma Progressão Aritmética (PA)\n');
    fprintf('3. Terminar\n\n');
    opcao = input('Opção: ');
    switch opcao
        case 1
            a_1 = input('Primeiro Elemento da PA: ');
              r = input('Razão da PA: ');
              n = input('Número de Elementos da PA: ');
              a = gerarPAritmetica_v4(a_1,r,n);
              disp(' ');
              disp('A Progressão Aritmética gerada é:');
              disp(' ');
              disp(a);
              disp(' ');
			  input('Prima uma tecla para continuar ...');
        case 2
            if(~isempty(a))
                S = SomaPAritmetica(a);
                fprintf('\nA soma dos elementos da PA introduzida é: %.1f\n',S);
            else
                disp('Começe por introduzir a Progressão aritmética')
            end
            disp(' ');
            input('Prima uma tecla para continuar ...');
        case 3
            CmdLineInterface_PA_PG();
    end
end
    
