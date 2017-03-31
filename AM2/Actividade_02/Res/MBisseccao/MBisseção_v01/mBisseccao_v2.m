function x = mBisseccao_v2(f,a,b,kmax,tol) 
%mBisseccao Método da Bissecção
%   x = mBisseccao(f,a,b,kmax,tpl)
%   x = [x0, x1, x2, ...] 
%INPUT:
%   f - função da equação não linear f(x)=0
%   a e b - limites do intervalo de localização da raiz [a, b]
%   kmax - número máximo de iterações do método
%   tol - tolerância = amplitude do intervalo
%OUTPUT: 
%   x - vector com as aproximações (pontos médios dos sub-intervalos)
%
%   02/12/09 - ArménioCorreia .: armenioc@isec.pt 

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