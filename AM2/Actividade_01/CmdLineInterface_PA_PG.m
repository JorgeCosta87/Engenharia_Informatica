%CmdLineInterface_PA_PG
%
%Chamada de SUB-FUN��ES
%   ProgressaoAritmetica_cmdLine
%   ProgressaoGeometrica_cmdLine
%
%
%Autor: Jorge Costa : a21250797@alunos.isec.pt
%
%Implementada com base na interface providenciada pelo professor:
%       Arm�nioCorreia .: armenioc@isec.pt

clear;
choice = 1;
while choice ~= 3 
    clc;
    disp('--------------------------------------------------------------');
    disp('     PROGRESS�O ARITM�TICA e PROGRESS�O GEOM�TRICA            ');
    disp('------------------------------------------------------------- ');
    
    options = {'1 - Progress�o Aritm�tica';...
               '2 - Progress�o Geom�trica';...
               '3 - Sa�r'};
           
    disp(options);
    choice = input('opc��o: ')
    
    %para contornar o erro gerado quando � pressionado o ENTER
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
    
