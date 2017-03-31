% Daniel Cardoso Oliveira
% 21230554
% danielco94@gmail.com
% Turma P8
% 05/04/2016
%
% (a)
% T=RTrapezios(@fTeste, 2, 3, 2)
% 
% T =
% 
%     0.7083
% 
% (b)
% out_S=RSimpson(@fTeste, 2, 3, 2)
% 
% out_S =
% 
%     0.6944
% 
% (c)
% T=RTrapezios(@fTeste, 2, 3, 10)
% 
% T =
% 
%     0.6938
% 
% (d)
% out_S=RSimpson(@fTeste, 2, 3, 10)
% 
% out_S =
% 
%     0.6932
% 
% (e)
% q=quad(@fTeste, 2, 3)
% 
% q =
% 
%     0.6931
% 
% (f) A regra de Simpson permite obter maior precisão. Devido à diferença
% entre o Erro obtido com o mesmo número de iterações, onde, com a regra
% dos trapézios com 10 iterações, temos um erro de 0.007, e com a regra de
% Simpson com o mesmo número de iterações obtemos um erro de 0,001.
%
% -- Cálculo da solução exata:
% syms x
% sExata=int(1/(x-1),2,3)
%  
% sExata =
%  
%    log(2)
%  
% log(2)
% 
% ans =
% 
%     0.6931