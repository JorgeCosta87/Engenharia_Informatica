%GERARPARITMENTICA_v4 Gerar uma Progress�o Aritm�tica(PA)
%   a = ProgressaoAritmetica(a_1,r,n)
%   a(n) = a(1)+(n-1)*r  
%
%INPUT:
%   a_1 - primeiro elemento da progressa�o aritm�tica
%   r - raz�o da progress�o aritm�tica
%   n - n�mero de elementos da progress�o aritm�tica 
%OUTPUT: 
%   a - vector com os elementos da progress�o aritm�tica
%   a(i) = a(1)+(i-1)*r , i=2,...,n
%
%   16/10/2012 - Arm�nioCorreia .: armenioc@isec.pt 
%              - Jo�oPedroAlves .: jpalves@isec.pt

function a = gerarPAritmetica_v4(a_1,r,n)
a = a_1:r:a_1+(n-1)*r;