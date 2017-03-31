function x = mBisseccao_v2(f,a,b,kmax,tol) 
%mBisseccao M�todo da Bissec��o
%   x = mBisseccao(f,a,b,kmax,tpl)
%   x = [x0, x1, x2, ...] 
%INPUT:
%   f - fun��o da equa��o n�o linear f(x)=0
%   a e b - limites do intervalo de localiza��o da raiz [a, b]
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%OUTPUT: 
%   x - vector com as aproxima��es (pontos m�dios dos sub-intervalos)
%
%   02/12/09 - Arm�nioCorreia .: armenioc@isec.pt 

k = 1;
while(k <= kmax),
   x(k) = (a+b)/2;
   if(feval(f,x(k)) == 0 || abs(b-a)/2 < tol)
       return; 
   end  
   if(feval(f,a)*feval(f,x(k)) < 0)
      b = x(k);
   else
      a = x(k);
   end
   k = k+1;
end