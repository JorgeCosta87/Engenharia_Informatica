
input = [ 

net = perceptron;

net.trainParam.epochs = 100;

net.trainFcn = 'traingdx';
net.divideFcn = '';
net = train(net, inputs, targets);

output = sim(net, inputs);

view(net);


%net.layers{numero_da_camda}.transferFcn = 'nome_da_funcao':

net.IW;
net.b;

plotpv(input,targets);