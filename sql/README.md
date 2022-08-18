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
``` sql
SELECT * FROM <nome da tabela>
    -- ou --
SELECT <nome das colunas> FROM <nome da tabela>
```
* o **" * "** mostra todas as colunas da tabela

Ordenar do menor para o maior: **ASC**
``` sql
ORDER BY <nome da coluna> ASC
```

Ordenar do maior para o menor: **DESC**
``` sql
ORDER BY <nome da coluna> DESC
```

Remover duplicidade: **DISTINCT**
``` sql
SELECT DISTINCT <nome da coluna> FROM <nome da tabela>
```

Concatenar dados: **||**
``` sql
SELECT <nome da coluna> || 'gmail.com'
```

Mostra a estrutura da tabela: **DESCRIBE**
``` sql
DESCRIBE <nome da tabela>
```
