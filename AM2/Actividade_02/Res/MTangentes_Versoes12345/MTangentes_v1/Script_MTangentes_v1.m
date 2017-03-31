clear 
clc

disp('Método das Tangentes')
disp('')

f = input('f(x)=','s');
a = input('a=');
b = input('b=');

ff    = @(x) eval(vectorize(f));
df    = diff(f);
df_dx = @(x) eval(vectorize(char(df)));
d2f =diff(df);
d2f_dx2 = @(x) eval(vectorize(char(d2f)));
while(1)
    x0    = input('x0=');
    if(feval(ff,x0)*feval(d2f_dx2,x0)>0) break; end
end
k_max = input('k_max=');
tol   = input('tol=');


xmT = mTangentes(ff,df_dx,x0,k_max,tol)

x=a:0.01:b;
plot(x,ff(x))
hold on
plot(x,zeros(length(x)))
plot(xmT(end),0,'or')
hold off
xlabel('x')
ylabel('y')
title('Método das tangentes')
text(xmT(end),1,num2str(xmT(end)))







