--FX3_EX1
select titulo
from livros
where to_char(data_edicao,'yyyy') = 2011;

--FX3_EX2
select  to_char(sysdate, 'HH:MI:SS') "Hora Actual", to_char(sysdate, 'DD, Month,YYYY')
from dual;

--FX3_EX3
select titulo, preco_tabela
from livros
where data_edicao >  (sysdate - 80);

--FX3_EX4
select distinct titulo
from livros l, vendas v, clientes c
where l.CODIGO_LIVRO = v.CODIGO_LIVRO and v.CODIGO_CLIENTE = c.CODIGO_CLIENTE 
and c.morada like '%Lisboa' and
v.DATA_VENDA >= to_date('2013,08','yyyy,mm') 
and v.DATA_VENDA < to_date('2013,10','yyyy,mm');

--outra solução
--to_char(Data_VENDA, 'MM-YYYY') IN ('08-2013','09-2013)

--FX3_EX5
select l.titulo, v.DATA_VENDA, l.DATA_EDICAO
from livros l, vendas v
where l.CODIGO_LIVRO = v.CODIGO_LIVRO and lower(l.genero) = 'informática'
and to_char(v.DATA_VENDA,'yyyy,mm') = to_char(l.DATA_EDICAO,'yyyy,mm');

--FX3_EX6
select a.nome,l.DATA_EDICAO
from autores a , livros l
where a.CODIGO_AUTOR = l.CODIGO_AUTOR and l.paginas > 190 
and l.DATA_EDICAO between to_date('2013,06,21','yyyy,mm,dd')
and to_date('2013,09,22','yyyy,mm,dd');

--FX3_EX7
select titulo, to_char(sysdate,'yyyy') - to_char(DATA_EDICAO,'yyyy') "Nº anos"
from livros
where lower(genero) = 'informática';

--outra solução
--MONTHS_BETWEEN(SYSDATE, DATA_EDICAO) / 12 ) N_ANOS

--FX3_EX8
select c.nome
from clientes c, vendas v, livros l
where c.CODIGO_CLIENTE = v.CODIGO_CLIENTE
and v.CODIGO_LIVRO = l.CODIGO_LIVRO
and to_char(v.DATA_VENDA, 'DD') < '09'
and to_char(v.DATA_VENDA, 'D')= '3'
and to_number(to_char(v.DATA_VENDA,'HH24')) < 17;


--FX3_EX9
select nome
from autores
Minus
select nome
from autores a, livros l
where l.CODIGO_AUTOR = a.CODIGO_AUTOR;


--FX3_EX10
select nome
from autores
Minus
select nome
from autores a, livros l
where l.CODIGO_AUTOR = a.CODIGO_AUTOR
union
select nome
from livros
where to_char(DATA_EDICAO, 'yyyy') = to_char(sysdate , 'yyyy');

