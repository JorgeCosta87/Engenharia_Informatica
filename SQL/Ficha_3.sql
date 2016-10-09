--FX3_EX1
select titulo
from livros
where to_char(data_edicao,'yyyy') = 2011;

--FX3_EX2
select  to_char(sysdate, 'HH:MI:SS') "Hora Actual", to_char(sysdate, 'DD, Month,YYYY')
from dual;
