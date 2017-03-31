
%gerarPGeometrica_v1 Gera uma Progressão Geométrica
%   a = ProgressaoAritmetica(a_1,r,n)
%   a(n) = a(1) *   
%
%INPUT:
%   a_1 - primeiro elemento da progressaão Geométrica
%   r - razão da progressão geométrica
%   n - número de elementos da progressão geométrica 
%OUTPUT: 
%   a - vector com os elementos da progressão aritmética
%    
%TERMO GERAL:
%
%   a(i) = a(1) * r^(i-1), i=2,.,n
%
%   05/03/2017 - Jorge Costa - a21250797@alunos.isec.pt 


function a = gerarPGeometrica_v4(a_1, r, n)

 a = a_1 * r.^(0:n-1); 
 
end

