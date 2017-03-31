clc
clear

f=@(x) abs(x)-exp(x);
a=-1;
b=0;
kmax=3;
tol=0.01;

c=MBissecao_v01(f,a,b,kmax,tol);
fprintf('a raiz é aprox = %.2f\n',c);
x=MBissecao_v02(f,a,b,kmax,tol);
disp(x);