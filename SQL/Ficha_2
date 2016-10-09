--FX2EX1
Select titulo
from livros,autores
where genero = 'Policial' and nome = 'Cláudio Tereso';

--FX2EX2
Select titulo 
from livros, autores
where genero = 'Policial'
and morada like '%Coimbra';

--FX2EX3
select nome 
from autores, livros
where autores.codigo_autor = livros.CODIGO_AUTOR and genero = genero_preferido;

--FX2EX4
select titulo, preco_tabela 
from livros l, vendas, clientes c
where c.morada like '%Coimbra' and vendas.codigo_cliente = c.codigo_cliente and l.codigo_livro = vendas.CODIGO_LIVRO; 


--FX2EX5
select Distinct a.nome
from autores a,  clientes c
where  a.nome = c.nome;

--FX2EX6
select a.nome, l.titulo, l.genero
from AUTORES a, livros l
where a.GENERO_PREFERIDO != l.genero and l.CODIGO_AUTOR = a.CODIGO_AUTOR
order by a.nome ;

--FX2EX7
select titulo, (PRECO_TABELA * UNIDADES_VENDIDAS) * 0.30 As "Rendeu"
from livros;

--FX2EX8
select titulo, (PRECO_TABELA * UNIDADES_VENDIDAS) As "Rendeu"
from livros
where (preco_tabela * unidades_vendidas)  > 10000;

--FX2EX9
select titulo, ROUND((preco_tabela / paginas),2) "Custo página"
from livros
where paginas between 400 and 700;

--FX2EX10
select upper(titulo) "Título ( em maiúsculas )",
lower(titulo) "Título (em minúsculas)", 
initcap(titulo) "Título(1º em maiúsculas)"
from livros;

--FX2EX11
select titulo 
from livros
where upper(genero) = upper('informática');

--FX2EX12
select nome "Nome completo", substr(nome,1,instr(nome,' ',1)) "Primeiro nome",
substr(nome,instr(nome,' ', -1),length(nome)) "Ultimo nome"
from autores;

--FX2EX13
select upper(l.titulo), lower(l.genero), initcap(a.nome) "Nome Autor"
from AUTORES a, LIVROS l, editoras e
where  l.CODIGO_EDITORA = e.codigo_editora and e.nome = 'FCA - EDITORA' and l.CODIGO_AUTOR = a.codigo_autor;

--FX2EX14
select titulo
from livros
where length(titulo) > 20;

--FX2EX15
select titulo, preco_tabela, round((preco_tabela * 1.1355),1) preco_com_aumento
from livros
where genero='Policial';

--Exercicios propostos
--a)
select titulo, genero
from livros
where (genero != 'Policial' and genero != 'Romance') or substr(titulo,1,1) = 'O'; -- atençao a precendecia dos operadores


--b
select titulo, preco_tabela "Preco em euros", (preco_tabela * 200 + 4.82) "Preço em Escudos"
from livros;
