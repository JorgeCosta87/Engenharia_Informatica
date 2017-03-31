function c = mBisseccao(f,a,b,kmax,tol) 
%mBisseccao Método da Bissecção
%   c = mBisseccao(f,a,b,kmax,tpl)
%   c = (a+b)/2 
%INPUT:
%   f - função da equação não linear f(x)=0
%   a e b - limites do intervalo de localização da raiz [a, b]
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%OUTPUT: 
%   c - ponto médio do último intervalo da sub-divisão dos sucessivos
%   intervalos
%
%   02/12/09 - ArménioCorreia .: armenioc@isec.pt 

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