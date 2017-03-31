function x = mTangentes(f,df_dx,x0,kmax,tol) 
%mTangentes M�todo das Tangentes
%   x = mTangentes(f,df_dx,a,b,kmax,tpl)
%   x(k+1) = x(k)-f(x(k))/f'(x(k)),  k = 0,1,2 
%INPUT:
%   f - fun��o da equa��o n�o linear f(x)=0
%   df_dx - derivada da fun��o f'(x)
%   x0 - aproxima��o inicial pertencente a [a, b]: f(x0)*f''(x0)>0
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%OUTPUT: 
%   x - vector das aproxima��es
%
%   17/03/2012 - Arm�nioCorreia .: armenioc@isec.pt
%              - JPAlves        .: jpalves@isec.pt


k = 1;
x(k) = x0;
while(k <= kmax),
   x(k+1) = x(k)-f(x(k))/df_dx(x(k));
   if(abs(x(k+1)-x(k))<tol) 
       return; 
   end  
   k = k+1;
end