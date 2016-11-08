--FX4_EX1
Select count(titulo) as "Total livros informática"
from livros
where upper(genero)= upper('informática');

--FX4_EX2
select count(codigo_livro) "Total Livros", avg(preco_tabela),sum(unidades_vendidas)
from LIVROS;

--FX4_EX3
select genero, COUNT(*)
from LIVROS
group by genero -- o que não é função de grupo tem de estar em group by
order by genero;

--FX4_EX4
select titulo, min(v.preco_unitario) "P_mais_baixo", max(v.preco_unitario) "P_mais_Alto", avg(v.PRECO_UNITARIO) "P_medio"
from livros, vendas v
where livros.CODIGO_LIVRO= v.CODIGO_LIVRO and upper(genero) = upper('informática')
group by titulo;


--FX4_EX5
select genero, (max(preco_tabela) - min(preco_tabela)) Diferença
from livros
group by genero;

--FX4_EX6
select titulo, preco_tabela Preco, sum(v.quantidade) unidades_vendidas, sum(v.quantidade) * preco_tabela REC_ESPERADA,
sum(v.quantidade * v.preco_unitario)  REC_efectiva
from livros, vendas v
where livros.codigo_livro= v.codigo_livro
group by titulo, preco_tabela;

--FX4_EX7
select  genero, avg(preco_tabela) PRECO_MEDIO
from livros;


--FX4_EX8
select NOME, min(preco_tabela) as "PRECo min"
from livros l, autores a
where a.codigo_autor = l.codigo_autor
group by nome
having min(preco_tabela) > 30
order by 2;

--FX4_EX9
select c.codigo_cliente, nome,
  sum(quantidade) as "n LIVROS",
  avg(preco_unitario) AS " PREC MEDIO",
  count( DISTINCT codigo_autor)-- so conta o numero de linhas onde o valor é diferente
  from  clientes c, vendas v, livros l
  where l.codigo_livro = v.CODIGO_LIVRO
  and v.codigo_cliente = c.codigo_cliente
  and upper(MORADA) like '%LISBOA'
  group by c.codigo_cliente, NOME
  having sum(QUANTIDADE) > 3
  and count(distinct codigo_editora) = 1;
  



--FC_EX(


