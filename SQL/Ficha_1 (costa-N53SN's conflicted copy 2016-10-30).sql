--FX1EX1
Select * From autores;

--FX1EX2
Select Titulo from livros;

--FX1EX3
Select distinct genero from livros;

--FX1EX4
Select titulo from livros where preco_tabela between 25 and 35;

--FX1EX5
Select codigo_livro, titulo from livros where genero = 'Informática';

--FX1EX6
Select titulo from livros where paginas > 500;

--FX1EX7
Select genero from livros where paginas > 700 or preco_tabela > 45;

--FX1EX8
Select titulo, preco_tabela from livros 
where genero = 'Informática' 
order by preco_tabela desc;

--FX1EX9

Select isbn, titulo, preco_tabela, quant_em_stock from livros
order by 3 desc, 4 asc;

--FX1EX10
Select codigo_autor from livros;

--FX1EX11
Select titulo
from livros
where genero != 'Policiail';

--FX1EX12
Select titulo from livros where not genero = 'Policial';

--FX1EX13
Select nome 
from autores
where idade > 30 and genero_preferido = 'Policial'
order by nome;

--FX1EX14
Select nome 
from autores 
where nome like '%r%' or nome like '%d%';

--FX1EX15
Select titulo 
from livros 
where titulo like 'O%' 
and titulo like '%st%' 
or
titulo like 'M%' 
and titulo like '%to%';

--FX1EX16
select titulo from livros where genero IN ('Policial', 'Romance', 'Aventure');

--FX1EX17
select 'O Livro ' || titulo || ' custa ' || preco_tabela || ' euros.'from livros;


