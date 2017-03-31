%FRvr Declarar/definir uma função de x
%   f = FRvr()
%   y = f(x) definição através de function_handle
%INPUT:
%   handles - handles para ter acesso aos dados introduzidos pelo
%             utilizador
%OUTPUT: 
%   f - função real de variável real x
%
%   07/03/2016 - ArménioCorreia .: armenioc@isec.pt
%   26/03/2017 - Jorge Costa    .: a21250797@alunos.isec.pt

function f=FRvr(fStr)

    f=@(x) eval(vectorize(fStr));
    try
        Fteste=f(sym('x'));
        return;
    catch 
        f = [];
    end
end