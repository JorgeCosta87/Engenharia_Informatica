function c = mBisseccao(f,a,b,kmax,tol) 
%mBisseccao M�todo da Bissec��o
%   c = mBisseccao(f,a,b,kmax,tpl)
%   c = (a+b)/2 
%INPUT:
%   f - fun��o da equa��o n�o linear f(x)=0
%   a e b - limites do intervalo de localiza��o da raiz [a, b]
%   kmax - n�mero m�ximo de itera��es do m�todo
%   tol - toler�ncia = amplitude do intervalo
%OUTPUT: 
%   c - ponto m�dio do �ltimo intervalo da sub-divis�o dos sucessivos
%   intervalos
%
%   02/12/09 - Arm�nioCorreia .: armenioc@isec.pt 

k = 1;
while(k <= kmax),
   c = (a+b)/2;
   if(feval(f,c) == 0 || abs(b-a)/2 < tol)
       return; 
   end  
   if(feval(f,a)*feval(f,c) < 0)
      b = c;
   else
      a = c;
   end
   k = k+1;
end