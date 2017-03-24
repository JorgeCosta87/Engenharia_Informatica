clc 
clear

x = -2*pi:0.1:2*pi;
y = cos(x);
h1 = plot(x,y)
shg
whos
ishandle(h1)

%doc handle

get(h1)                     %aceder as propriedades do handle
tipoH1 = get(h1,'Type')     %devolve o tipo de obj

%inspect(h1)                 %permite aceder a todas a propriedades do objecto numa janela
set(h1,'Color', [0 0 0]);
%or
disp('click para continuar')
%pause;
set(h1,'Color','g','LineWidth', 3.5);

h2 = get(h1,'Parent');      %obtem o objecto pai
tipoH2 = get(h2,'Type')

inspect(h2)
set(h2,'Color', [0 0 0],'Box', 'off');

child = get(get(h2,'child'),'Type')
