%MENUInterfacePROGARITMENTICA_PROGGEOMETRICA 
%Chamada de SUB-FUN��ES
%   MenuProgAritmetica
%   MenuProgAritmetica
%
%   24/10/2012 - Arm�nioCorreia .: armenioc@isec.pt 

clear;
menuProgressao = 1;
while menuProgressao ~= 3 
    clc;
    menuProgressao = menu('Progress�es', 'Progress�o Aritm�tica',...
                           'Progress�o Geom�trica','Sa�r');
  
    switch menuProgressao
        case 1
            MenuProgressaoAritmetica()
        case 2
            MenuProgressaoGeometrica()
    end
end
    