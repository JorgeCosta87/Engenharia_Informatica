%FRvr Declarar/definir uma fun��o de x
%   f = FRvr()
%   y = f(x) defini��o atrav�s de function_handle
%INPUT:
%   handles - handles para ter acesso aos dados introduzidos pelo
%             utilizador
%OUTPUT: 
%   f - fun��o real de vari�vel real x
%
%   07/03/2016 - Arm�nioCorreia .: armenioc@isec.pt
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