
%gerarPGeometrica_v1 Gera uma Progress�o Geom�trica
%   a = ProgressaoAritmetica(a_1,r,n)
%   a(n) = a(1) *   
%
%INPUT:
%   a_1 - primeiro elemento da progressa�o Geom�trica
%   r - raz�o da progress�o geom�trica
%   n - n�mero de elementos da progress�o geom�trica 
%OUTPUT: 
%   a - vector com os elementos da progress�o aritm�tica
%    
%TERMO GERAL:
%
%   a(i) = a(1) * r^(i-1), i=2,.,n
%
%   05/03/2017 - Jorge Costa - a21250797@alunos.isec.pt 


function a = gerarPGeometrica_v3(a_1, r, n )

  i = 2;
  a = zeros(1,n);
  a(1) = a_1;
  while (1)
     a(i) = a(1) * r^(i-1);
     i = i + 1;
     if( i > n ) 
         break; 
     end;
  end

end

