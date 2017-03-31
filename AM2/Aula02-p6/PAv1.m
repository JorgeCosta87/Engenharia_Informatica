function v = PAv1(v1, r, n)

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

%aloca memoria para o vetor invés de este ser redimensionado a cada iterção
v = zeros(1,n);

v(1) = v1;

for i=2:n
    v(i) = v1 +(i-1) * r;
end