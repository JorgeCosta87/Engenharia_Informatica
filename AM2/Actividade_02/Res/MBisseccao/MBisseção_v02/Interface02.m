clc
clear

while 1
    strF=input('f(x)=','s');
    f=@(x) eval(vectorize(strF));
    try
        fTeste=f(sym('x'));
        break;
    catch Me
        errordlg('Introduza uma f de x',...
                 'ERRO','modal');
    end
end

a=1;
b=2;
kmax=2;
tol=0.01;

% c=MBissecao_v01(f,a,b,kmax,tol);
% fprintf('a raiz é aprox = %.2f\n',c);
x=MBissecao_v02(f,a,b,kmax,tol);
disp(x);