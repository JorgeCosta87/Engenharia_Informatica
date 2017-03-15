function v = PAv4(v1, r, n)

%Gera um vetor v com n elementos uma PA(progressão aritmetica
%Inputs:
% v1 - 1º elemento da PA
% r  - razão/incremento/passo da PA
% output:
% v - vetorcom n elementos da PA
% Autor:
%Data ou versão

    if (n < 1)
        disp('O número de elementos deve ser superior a 0');
        return;
    end

    v = v1:r:(v1+(n-1)*r)
  
end
