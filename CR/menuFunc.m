function H_menu(x)
op = 0;

while(op ~=5)
    clc
    fprintf('**** Escolha uma opcção****\n');
    fprintf('1 - gera matriz aleatoria\n');
    
    
    op = input( '>> ');
    
    switch op
        case 1
            a = input('n. de linhas:');
            b = input('n. de colunas:');
        case 2
            
        otherwise fprintf('Error');
    end
end