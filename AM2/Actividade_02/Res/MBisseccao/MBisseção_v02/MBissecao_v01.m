function c=MBissecao_v01(f,a,b,kmax,tol)
k=1;
while k<=kmax
    c=(a+b)/2;
    if (f(c)==0 || abs(b-a)/2<tol)
        break;
    end
    if f(a)*f(c)<0
        b=c;
    else
        a=c;
    end
    k=k+1;
end
    
