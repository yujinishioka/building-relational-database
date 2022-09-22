## Acesso ao banco de dados da FIAP:

``` sql
Nome: FIAP

username: <matricula (com RM)>
senha: <data de nascimento>

hostname: oracle.fiap.com.br
port:  1521

SID: orcl
```

## Sintax:

Criar tabela
``` sql
CREATE TABLE <nome da tabela>
<nome da coluna> <Tipo> (<tamanho>),
<nome da coluna> <Tipo> (<tamanho>);
```

Inserir dados na tabela
``` sql
INSERT INTO <nome da tabela>(<campos>, <campos>)
VALUES (<valores>,<valores>);
```

Buscar dados na tabela: **SELECT**
* o **" * "** mostra todas as colunas da tabela
``` sql
SELECT * FROM <nome da tabela>;
    -- ou --
SELECT <nome das colunas> FROM <nome da tabela>;
```

Ordenar do menor para o maior: **ASC**
``` sql
ORDER BY <nome da coluna> ASC;
```

Ordenar do maior para o menor: **DESC**
``` sql
ORDER BY <nome da coluna> DESC
```

Remover duplicidade: **DISTINCT**
``` sql
SELECT DISTINCT <nome da coluna> FROM <nome da tabela>;
```

Concatenar dados: **||**
``` sql
SELECT <nome da coluna> || 'gmail.com';
```

Mostra a estrutura da tabela: **DESCRIBE**
``` sql
DESCRIBE <nome da tabela>;
```

Busca por dados especificos na tabela: **WHERE**
* para valores nulos, usa-se a sintax **IS NULL**
* para digitar o valor: **&**
``` sql
WHERE <nome da coluna> = <valor>;
WHERE <nome da coluna> > <valor>;
WHERE <nome da coluna> < <valor>;
WHERE <nome da coluna> >= <valor>;
WHERE <nome da coluna> <= <valor>;
WHERE <nome da coluna> != <valor>;
WHERE <nome da coluna> IS NULL;
WHERE <nome da coluna> > &VALOR;
```

Busca por dados ENTRE valores: **BETWEEN** **AND**
* Valor menor a esquerda, e maior a direita
``` sql
WHERE <nome da coluna> BETWEEN <valor> AND <valor>;
```

Busca por dados que nao estejam entre os valores: **NOT BETWEEN**
``` sql
WHERE  <nome da coluna> NOT BETWEEN <valor> AND <valor>;
```

Busca com varios valores: **IN**
``` sql
WHERE <nome da coluna> IN (<valor>, <valor>);
```

Busca com parte do valor: **LIKE**
* com final **" % "** busca todos os valores que iniciam ou terminam com determinado valor
* é possivel utilizar um **ESCAPE** para encontrar uma unidade reservada
``` sql
WHERE <nome da coluna> LIKE 'A%';
WHERE <nome da coluna> LIKE '%A';
WHERE <nome da coluna> LIKE '%A%';
WHERE <nome da coluna> LIKE '%__A%';
    -- ou --
WHERE <nome da tabela> LIKE '_\_%A%'
ESCAPE '\';
```

Ordenar os valores: **ORDER BY**
* **ORDER BY** sempre depois de **WHERE**
``` sql
SELECT * FROM <nome da tabela>
WHERE <nome da coluna> = <valor>
ORDER BY <nome da coluna>, <nome da coluna>;
```

Maior e Menor: **UPPER, LOWER** e **INITCAP**
``` sql
SELECT 'MARIO' FROM <nome da tabela>;
SELECT LOWER('MARIO') FROM <nome da tabela>;
SELECT UPPER('mArIo') FROM <nome da tabela>;
SELECT INITCAP('MARIO KART') FROM <nome da tabela>;

-- Faz a conversão antes de buscar
SELECT <nome da coluna> FROM <nome da tabela> WHERE LOWER<nome da coluna>) = LOWER(<valor>);
```

``` sql
SELECT 'MARIO' || ' KART' FROM <nome da tabela>;
SELECT CONCAT (INITCAP('MARIO '), INITCAP('KART')) FROM <nome da tabela>;
SELECT SUBSTR('MARIO',1,3) FROM <nome da tabela>;
SELECT SUBSTR('MARIO',-1,1) FROM <nome da tabela>;
SELECT LENGTH('MARIO KART') FROM <nome da tabela>;
SELECT INSTR('MARIO KART', ' ') FROM <nome da tabela>;
SELECT SUBSTR('MARIO KART', (INSTR('MARIO KART', ' ')+1), 4) FROM <nome da tabela>;
SELECT LPAD(123,10,'*') FROM <nome da tabela>;
SELECT TRIM('A' FROM 'AAAAMILTONAAAAA') FROM <nome da tabela>;
```

``` sql
SELECT ROUND(5678.98546, 5) FROM <nome da tabela>;
SELECT ROUND(5678.98546, 4) FROM <nome da tabela>;
SELECT ROUND(5678.98546, 3) FROM <nome da tabela>;
SELECT ROUND(5678.98546, 2) FROM <nome da tabela>;
SELECT ROUND(5678.98546, 1) FROM <nome da tabela>;
SELECT ROUND(5678.98546, 0) FROM <nome da tabela>;
SELECT ROUND(5678.98546, -1) FROM <nome da tabela>;
SELECT ROUND(5678.98546, -2) FROM <nome da tabela>;
SELECT ROUND(5678.98546, -3) FROM <nome da tabela>;
SELECT ROUND(5678.98546, -4) FROM <nome da tabela>;
```

``` sql
SELECT TRUNC(5678.98546, 4) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, 3) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, 2) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, 1) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, 0) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, -1) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, -2) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, -3) FROM <nome da tabela>;
SELECT TRUNC(5678.98546, -4) FROM <nome da tabela>;
```

Manipulando Datas: **SYSDATE**
``` sql
SELECT SYSDATE FROM <nome da tabela>;
SELECT SYSDATE + 30 FROM <nome da tabela>;
SELECT SYSDATE - 30 FROM <nome da tabela>;
SELECT (SYSDATE+30) - (SYSDATE-30) FROM <nome da tabela>;
SELECT (SYSDATE - TO_DATE('08/MAY/1959','DD/MONTH/YYYY'))/7 FROM <nome da tabela>;
SELECT SYSDATE FROM <nome da tabela>;
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI:SS';
SELECT SYSDATE+5/24/60 FROM <nome da tabela>;
SELECT ADD_MONTHS(SYSDATE,3) FROM <nome da tabela>;
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE,3),'FRIDAY') FROM <nome da tabela>;
SELECT NEXT_DAY(LAST_DAY(SYSDATE),'MONDAY') FROM <nome da tabela>;
```

Juntando Tabelas: **JOIN**'s
* NATURAL JOIN
``` sql
    /*
    NATURAL JOIN
    */
    SELECT <colunas> FROM <tabela> NATURAL JOIN <coluna>
    -- sendo esta ultima coluna, a coluna compartilhada

    /*
    JOIN com USING
    permite indicar a coluna que sera usada para unir os dados das tabelas
    */
    SELECT <colunas> FROM <tabela> JOIN <coluna> USING (<coluna>)

    /*
    JOIN com ON
    permite indicar mais de uma coluna para unir os dados da tabela
    */
    -- ARRUMARRRRR
    select * from dept;
    select * from emp;
    ------
    --- Sintaxe anterior a ANSI 1999
    ------
    --- AMBIGUIDADE ocorre quando o interpretador
    --- não consegue determinar de qual tabela
    --- ele deve pegar as informações.
    --- Isso é resolvido qualificando a coluna com
    --- o nome da tabela.
    ------
    SELECT ENAME, DNAME, SAL, E.DEPTNO, D.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND
        SAL > 2900;
    ------
    --- SINTAXE ANSI 1999
    ------
    ------
    --- NATURAL JOIN une os dados de tabelas
    --- baseado em todas as colunas com o mesmo
    --- nome nas tabelas.
    ------
    SELECT ENAME, DNAME
    FROM EMP NATURAL JOIN DEPT;
    ------
    --- JOIN com USING permite indicar a coluna
    --- que será usada para unir os dados das 
    --- tabelas
    ------
    SELECT ENAME, DNAME
    FROM EMP JOIN DEPT
    USING (DEPTNO);
    ------
    --- JOIN com ON permite indicar mais de uma
    --- coluna para unir os dados das tabelas
    ------
    SELECT ENAME, DNAME
    FROM EMP E JOIN DEPT D
        ON (E.DEPTNO = D.DEPTNO);
    ------
    --- EQUIJOIN são consultas onde os valores
    --- das variáveis devem ser iguais
    --- NON-EQUIJOIN são consultas que usam faixas
    --- de valores para unir duas tabelas
    ------
    SELECT ENAME, SAL, GRADE
    FROM EMP JOIN SALGRADE
        ON (SAL BETWEEN LOSAL AND HISAL);
    ------
    --- SELF JOIN são consulta que precisam unir
    --- dados de uma mesma tabela
    ------
    SELECT G.ENAME, E.ENAME
    FROM  EMP G JOIN EMP E
        ON (E.MGR = G.EMPNO);

    SELECT G.ENAME || ' É GERENTE DE ' || 
        E.ENAME "GERENTE E FUNCIONÁRIOS"
    FROM  EMP G JOIN EMP E
        ON (E.MGR = G.EMPNO);
    ------
    --- LEFT OUTER JOIN lista todos os dados que
    --- possuem igualdade e os dados da tabela a
    --- esquerda que não possuem igualdade com a
    --- tabela a direita
    -----
    SELECT ENAME, DNAME
    FROM EMP LEFT OUTER JOIN DEPT
        ON (EMP.DEPTNO = DEPT.DEPTNO);
    ------
    --- RIGHT OUTER JOIN lista todos os dados que
    --- possuem igualdade e os dados da tabela a
    --- direita que não possuem igualdade com a
    --- tabela a esquerda
    -----
    SELECT ENAME, DNAME
    FROM EMP RIGHT OUTER JOIN DEPT
        ON (EMP.DEPTNO = DEPT.DEPTNO);
    ------
    --- FULL OUTER JOIN lista todos os dados que
    --- possuem igualdade e os dados da tabela a
    --- direita que não possuem igualdade com a
    --- tabela a esquerda e vice-versa
    -----
    SELECT ENAME, DNAME
    FROM EMP FULL OUTER JOIN DEPT
        ON (EMP.DEPTNO = DEPT.DEPTNO);
    ------
    --- CROSS JOIN une cada linha de uma tabela 
    --- com cada linha de outra tabela
    ------
    SELECT ENAME, DNAME
    FROM EMP CROSS JOIN DEPT;
```

Comentarios: " **--** " ou " **/* */** " ou " **rem** "
``` sql
-- isto é um comentario

/*
isto tambem é 
um comentario
*/

rem mais um comentario
```