function rn3b()
%Funcao rn3b: cria, treina e testa uma RN feedforward
%usando as funcoes da NNTool

% limpar
clear all;
close all;

% inicializar entrada
p = [0 0 1 1; 0 1 0 1];
in =[0 0 0 0 0 0 0 1 1 1 1 1 1 1 1
     0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1
     0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
     0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
 
t = [1 0 0 1 0 1 1 0 0 1 1 0 1 0 0 1];


% COMPLETAR: criar RN chamada net
net = feedforwardnet();


% COMPLETAR: ajustar os parametros seguintes
net.layers{2}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA

% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs = 100;

% FUNCAO DE TREINO 
net.trainFcn = 'traingdx';


% TODOS OS EXEMPLOS DE INPUT SAO USADOS NO TREINO
net.divideFcn = '';                 

% COMPLETAR: treinar a rede
net = train(net, p, t);

% visualizar a rede
view(net)

% COMPLETAR simular a rede e guardar o resultado na variavel y

y = sim(net,p);
% Mostrar resultado
y = (y >= 0.5);
fprintf('Saida da RN para %s:', op);
disp(y);
fprintf('Saida desejada para %s:', op);
disp(t);

end