function p = PHorner( a,x )

%objectivo calcular as imagens de x no pol suando o met horner
%Inputs
%   a - vetor de coefs do pol por ordem decrescente
%   x - valotr/vetor de objectos a calcular no pol

%outputs
% p - valor/vetor das imagens de x no pol


p = a(1); % inicializar p com coef de maior grau
n = length(a);

for i=2:n
    p=p.*x+a(i);
end

end

