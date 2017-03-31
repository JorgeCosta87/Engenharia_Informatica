function x = mTangentes(f,df_dx,x0,kmax,tol) 
%mTangentes Método das Tangentes
%   x = mTangentes(f,df_dx,a,b,kmax,tpl)
%   x(k+1) = x(k)-f(x(k))/f'(x(k)),  k = 0,1,2 
%INPUT:
%   f - função da equação não linear f(x)=0
%   df_dx - derivada da função f'(x)
%   x0 - aproximação inicial pertencente a [a, b]: f(x0)*f''(x0)>0
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%OUTPUT: 
%   x - vector das aproximações
%
%   02/12/09 - ArménioCorreia .: armenioc@isec.pt 

k = 1;
x(k) = x0;
while(k <= kmax),
   x(k+1) = x(k)-feval(f,x(k))/feval(df_dx,x(k));
   if(abs(x(k+1)-x(k))<tol) 
       return; 
   end  
   k = k+1;
end