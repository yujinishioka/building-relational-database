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
```
ORDER BY <nome da coluna> DESC;
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

Comentarios: " **--** " ou " **/* */** " ou " **rem** "
``` sql
-- isto é um comentario

/*
isto tambem é 
um comentario
*/

rem mais um comentario
```