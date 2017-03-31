function x=MBissecao_v02(f,a,b,kmax,tol)
k=1;
while k<=kmax
    x(k)=(a+b)/2;
    if (f(x(k))==0 || abs(b-a)/2<tol)
        break;
    end
    if f(a)*f(x(k))<0
        b=x(k);
    else
        a=x(k);
    end
    k=k+1;
end
    
