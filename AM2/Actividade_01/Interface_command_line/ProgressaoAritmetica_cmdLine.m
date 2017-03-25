%PROGRESSAOARITMENTICA_INTERFACE_v1 
%   r    = a(i)-a(i-1) , i=1..n 
%   a(n) = a(1)+(n-1)*r  
%   S(n) = (a(1)+a(n))/2*n
%
%Chamada de SUB-FUN��ES
%   Progress�oAritm�tica_v4 - Gerar uma Progress�o Aritm�tica
%   SomaPAritmetica - Soma dos n primeiros elementos de uma PA
%
%   16/10/2012 - Arm�nioCorreia .: armenioc@isec.pt 

clear;
opcao = 1;
a = [];
while opcao ~= 3 
    clc;
    disp('PROGRESS�O ARITM�TICA');
    disp(' ');
    fprintf('1. Gerar uma Progress�o Aritm�tica (PA)\n'); 
    fprintf('2. Somar os elementos de uma Progress�o Aritm�tica (PA)\n');
    fprintf('3. Terminar\n\n');
    opcao = input('Op��o: ');
    switch opcao
        case 1
            a_1 = input('Primeiro Elemento da PA: ');
              r = input('Raz�o da PA: ');
              n = input('N�mero de Elementos da PA: ');
              a = gerarPAritmetica_v4(a_1,r,n);
              disp(' ');
              disp('A Progress�o Aritm�tica gerada �:');
              disp(' ');
              disp(a);
              disp(' ');
			  input('Prima uma tecla para continuar ...');
        case 2
            if(~isempty(a))
                S = SomaPAritmetica(a);
                fprintf('\nA soma dos elementos da PA introduzida �: %.1f\n',S);
            else
                disp('Come�e por introduzir a Progress�o aritm�tica')
            end
            disp(' ');
            input('Prima uma tecla para continuar ...');
        case 3
            CmdLineInterface_PA_PG();
    end
end
    
