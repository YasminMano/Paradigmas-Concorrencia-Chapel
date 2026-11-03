# Parte 1 — Threads e Sincronização em Chapel

## 1. Como funciona a concorrência em Chapel?

Chapel utiliza um modelo de concorrência baseado em tarefas (*tasks*). Essas tarefas representam unidades de trabalho concorrentes e não correspondem necessariamente a threads do sistema operacional.

O runtime do Chapel é responsável por escalonar as tarefas, que podem ser executadas por threads do sistema operacional. Dessa forma, o programador utiliza as construções da linguagem para expressar a concorrência, sem precisar gerenciar diretamente cada thread.

## 2. Como criar tarefas concorrentes?

Chapel oferece diferentes construções:

### begin

Inicia uma tarefa concorrente sem esperar imediatamente sua conclusão.

Exemplo: 03_begin.chpl

### cobegin

Executa blocos independentes concorrentemente e aguarda a conclusão de todos.

Exemplo: 01_criacao_tarefas.chpl

### coforall

Cria uma tarefa para cada iteração do laço, aguardando todas terminarem.

Exemplo: 02_coforall.chpl

Ao executar o primeiro programa duas vezes, observei que a ordem das tarefas mudou. Na primeira execução, elas apareceram na sequência 1, 2 e 3; na segunda, 2, 3 e 1. Isso ajudou a perceber que o cobegin permite executar tarefas concorrentes sem garantir a ordem em que as mensagens serão impressas.

## 3. Compartilhamento de memória

As tarefas podem acessar dados compartilhados por referência.

Quando várias tarefas modificam simultaneamente uma variável sem sincronização, pode ocorrer uma condição de corrida (race condition).

### Experimento realizado

Arquivo: 04_memoria_compartilhada.chpl

Foram executadas 10.000 tarefas concorrentes, cada uma incrementando um contador compartilhado.

Resultado esperado: 10.000
Resultado observado: 9.959

Foram perdidos 41 incrementos.

Isso ocorreu porque a operação contador += 1 não é atômica.

O resultado pode variar entre execuções.

## 4. Sincronização com atomic

Arquivo: 05_sincronizacao_atomic.chpl

Foi utilizada uma variável do tipo atomic int.

A operação contador.add(1) realiza o incremento atomicamente, impedindo a perda de atualizações nesse experimento.

Resultado esperado: 10.000
Resultado observado: 10.000

## 5. Sincronização com sync

Arquivo: 06_sincronizacao_sync.chpl

Uma variável sync possui estados cheio e vazio e permite coordenar tarefas concorrentes.

No experimento:

1. O consumidor aguarda uma mensagem.
2. O produtor envia o valor 42.
3. O consumidor recebe esse valor.
4. Ambas as tarefas terminam.

O método writeEF() escreve quando a variável está vazia e a torna cheia.

O método readFE() lê quando a variável está cheia e a torna vazia.

## 6. Diferença entre atomic e sync

atomic: Indicado para operações atômicas sobre dados compartilhados, como incrementar contadores.

sync: Indicado para coordenar a comunicação e a espera entre tarefas.

Também existe o bloco sync, que aguarda a conclusão das tarefas begin criadas em seu escopo.

## 7. Conclusão

Chapel oferece construções nativas para criar tarefas concorrentes e mecanismos para coordenar sua execução.

Os experimentos demonstraram que o acesso concorrente a dados compartilhados pode gerar condições de corrida.

A utilização de atomic e sync permite resolver diferentes problemas de sincronização.

Esses recursos tornam Chapel adequada para aplicações que exigem paralelismo e processamento concorrente.