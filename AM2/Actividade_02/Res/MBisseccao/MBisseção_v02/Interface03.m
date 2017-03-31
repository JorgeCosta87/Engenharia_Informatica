clc
clear

f=FrVr();

a=1;
f(a)
b=2;
f(b)
kmax=2;
tol=0.01;

% c=MBissecao_v01(f,a,b,kmax,tol);
% fprintf('a raiz é aprox = %.2f\n',c);
x=MBissecao_v02(f,a,b,kmax,tol);
disp(x);