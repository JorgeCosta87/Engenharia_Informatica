%MENUInterfacePROGARITMENTICA_PROGGEOMETRICA 
%Chamada de SUB-FUNÇÕES
%   MenuProgAritmetica
%   MenuProgAritmetica
%
%   24/10/2012 - ArménioCorreia .: armenioc@isec.pt 

clear;
menuProgressao = 1;
while menuProgressao ~= 3 
    clc;
    menuProgressao = menu('Progressões', 'Progressão Aritmética',...
                           'Progressão Geométrica','Saír');
  
    switch menuProgressao
        case 1
            MenuProgressaoAritmetica()
        case 2
            MenuProgressaoGeometrica()
    end
end
    