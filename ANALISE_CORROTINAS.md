# Corrotinas em Chapel

## 1. O que são corrotinas?

Corrotinas são rotinas que podem suspender sua execução e retomá-la posteriormente, preservando seu estado entre as suspensões.

Diferentemente de uma função convencional, que retorna e encerra sua execução, uma corrotina pode continuar a partir de um ponto anterior.

## 2. Chapel possui corrotinas?

Chapel possui iteradores com a instrução yield.

O yield permite entregar um valor ao consumidor e suspender a execução do iterador até que a próxima iteração seja solicitada.

Esse mecanismo apresenta características semelhantes às de corrotinas.

Entretanto, iteradores com yield não equivalem automaticamente a corrotinas assíncronas, como as utilizadas com async/await.

## 3. Demonstração prática

Arquivo: 07_iteradores_yield.chpl

O programa utiliza um iterador que produz os números de 1 a 3.

Em cada iteração:

1. O iterador produz um número.
2. O comando yield entrega o valor.
3. O consumidor recebe e processa o número.
4. O iterador retoma a execução.

## 4. Relação com concorrência

O uso de yield não implica execução paralela.

O exemplo demonstra suspensão e retomada de um iterador, mas não cria tarefas concorrentes.

Para concorrência entre tarefas, Chapel oferece construções como begin, cobegin e coforall.

## 5. Conclusão

Chapel oferece iteradores com yield, que permitem suspender e retomar a produção de valores.

Esse recurso possui semelhanças com corrotinas, mas não demonstra, por si só, suporte a corrotinas assíncronas nativas.

O principal modelo de concorrência de Chapel é baseado em tarefas.