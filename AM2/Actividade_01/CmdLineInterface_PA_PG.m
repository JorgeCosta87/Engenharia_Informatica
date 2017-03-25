%CmdLineInterface_PA_PG
%
%Chamada de SUB-FUNÇÕES
%   ProgressaoAritmetica_cmdLine
%   ProgressaoGeometrica_cmdLine
%
%
%Autor: Jorge Costa : a21250797@alunos.isec.pt
%
%Implementada com base na interface providenciada pelo professor:
%       ArménioCorreia .: armenioc@isec.pt

clear;
choice = 1;
while choice ~= 3 
    clc;
    disp('--------------------------------------------------------------');
    disp('     PROGRESSÃO ARITMÉTICA e PROGRESSÃO GEOMÉTRICA            ');
    disp('------------------------------------------------------------- ');
    
    options = {'1 - Progressão Aritmética';...
               '2 - Progressão Geométrica';...
               '3 - Saír'};
           
    disp(options);
    choice = input('opcção: ')
    
    %para contornar o erro gerado quando é pressionado o ENTER
    if(isempty(choice))
        choice = 1;
        continue;
    end
   
    switch choice
        case 1
            ProgressaoAritmetica_cmdLine();
        case 2
            ProgressaoGeometrica_cmdLine();
    end
end
    
