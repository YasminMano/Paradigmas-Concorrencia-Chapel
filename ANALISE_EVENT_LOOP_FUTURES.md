# Event Loop, Promises e Futures em Chapel

## 1. O que é um Event Loop?

Um event loop é um mecanismo que recebe eventos e coordena seu processamento.

Em ambientes assíncronos, como JavaScript, ele é associado ao agendamento de callbacks e à execução de tarefas quando ficam prontas.

## 2. Chapel utiliza Event Loop?

O modelo principal de concorrência de Chapel é baseado em tarefas (tasks).

A linguagem oferece recursos como begin, cobegin e coforall para expressar concorrência.

Chapel não depende de um event loop central semelhante ao de JavaScript para executar tarefas.

Entretanto, é possível implementar um despachante de eventos com recursos da linguagem.

## 3. Demonstração do Event Loop

Arquivo: 09_event_loop.chpl

O programa possui duas tarefas concorrentes:

- Produtor: envia eventos.
- Consumidor: recebe e processa eventos.

A comunicação utiliza uma variável sync string.

O consumidor executa um laço que aguarda eventos e chama uma função para processá-los.

Essa implementação representa um despachante didático de eventos, não um runtime completo de event loop assíncrono com I/O não bloqueante.

## 4. O que são Promises?

Promises representam resultados de operações que podem ser concluídas posteriormente.

Em JavaScript, uma Promise possui estados como pending, fulfilled e rejected.

Promises também permitem encadear operações e tratar erros.

## 5. Futures em Chapel

Chapel disponibiliza um módulo chamado Futures.

Esse módulo oferece recursos para iniciar operações assíncronas e recuperar resultados.

Entre os recursos utilizados no projeto estão:

- async(): inicia um cálculo assíncrono.
- get(): aguarda e recupera o resultado.

## 6. Demonstração com sync

Arquivo: 08_promises_equivalente.chpl

O programa inicia uma tarefa com begin e usa uma variável sync int para comunicar o resultado.

A tarefa principal continua executando até solicitar o valor.

A operação readFE() aguarda quando o resultado ainda não está disponível.

Essa implementação é semelhante a um Future, mas não implementa uma API completa de Promises.

## 7. Demonstração com Futures

Arquivo: 10_futures.chpl

O programa inicia um cálculo assíncrono que multiplica 25 por 2.

Enquanto o cálculo é realizado, o fluxo principal continua.

Quando get() é chamado, a execução aguarda o resultado, se necessário.

O resultado esperado é 50.

## 8. Conclusão

Nos testes realizados, observamos que Chapel trabalha com tarefas concorrentes sem depender de um event loop central, como acontece em JavaScript. Para investigar esse conceito, implementamos um despachante com duas tarefas: uma responsável pelo envio dos eventos e outra pelo processamento.

Também testamos duas formas de trabalhar com resultados futuros. Primeiro, utilizamos `begin` e uma variável `sync` para compartilhar o resultado de uma tarefa. Depois, utilizamos o módulo `Futures`, que já disponibiliza recursos para executar operações assíncronas e recuperar seus resultados.

A principal diferença observada foi que Chapel permite expressar a concorrência diretamente por meio de tarefas. O event loop desenvolvido no projeto é apenas uma simulação didática, enquanto o módulo `Futures` faz parte das bibliotecas disponibilizadas pela linguagem.