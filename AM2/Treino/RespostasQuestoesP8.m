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
% (f) A regra de Simpson permite obter maior precis�o. Devido � diferen�a
% entre o Erro obtido com o mesmo n�mero de itera��es, onde, com a regra
% dos trap�zios com 10 itera��es, temos um erro de 0.007, e com a regra de
% Simpson com o mesmo n�mero de itera��es obtemos um erro de 0,001.
%
% -- C�lculo da solu��o exata:
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