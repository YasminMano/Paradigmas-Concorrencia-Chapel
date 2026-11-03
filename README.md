# Trabalho 3 — Análise de Concorrência em Chapel

**Disciplina:** Paradigmas de Programação

**Linguagem:** Chapel 2.10.0

## Objetivo

Analisar os mecanismos de concorrência da linguagem Chapel, demonstrando suas construções para criação de tarefas, compartilhamento de memória, sincronização e diferentes modelos de concorrência.

O projeto contém exemplos práticos desenvolvidos e executados no Ubuntu 26.04 LTS via WSL, utilizando o Visual Studio Code.

## Parte 1 — Threads e sincronização

| Arquivo | Conteúdo |
|---------|----------|
| 01_criacao_tarefas.chpl | Tarefas com cobegin |
| 02_coforall.chpl | Tarefas com coforall |
| 03_begin.chpl | Tarefas com begin |
| 04_memoria_compartilhada.chpl | Race condition |
| 05_sincronizacao_atomic.chpl | Sincronização atomic |
| 06_sincronizacao_sync.chpl | Sincronização sync |

## Parte 2 — Modelos de concorrência

| Arquivo | Conteúdo |
|---------|----------|
| 07_iteradores_yield.chpl | Iteradores com yield — comparação com corrotinas |
| 08_promises_equivalente.chpl | Resultado futuro com sync |
| 09_event_loop.chpl | Despachante de eventos |
| 10_futures.chpl | Biblioteca Futures |
| 11_modelo_atores.chpl | Comunicação inspirada em Atores |
| 12_paralelismo_dados.chpl | Paralelismo com forall |

## Como executar

### Requisitos

- Chapel 2.10.0
- Ambiente Linux compatível
- Compilador LLVM

### Compilação

Para compilar um programa:

```bash
chpl 01_criacao_tarefas.chpl -o 01_criacao_tarefas
```

### Execução

```bash
./01_criacao_tarefas
```

O mesmo procedimento pode ser utilizado nos demais arquivos, substituindo seus nomes.

## Resultados experimentais

### Compartilhamento de memória

No experimento sem sincronização, 10.000 tarefas incrementaram um contador compartilhado.

- Valor esperado: 10.000
- Valor observado: 9.959
- Incrementos perdidos: 41

Com a utilização de atomic, o resultado observado foi 10.000.

Esses resultados demonstram os riscos de condições de corrida e a importância da sincronização em programas concorrentes.

## Documentação detalhada

- [Threads e sincronização](ANALISE_THREADS.md)
- [Corrotinas](ANALISE_CORROTINAS.md)
- [Event Loop e Futures](ANALISE_EVENT_LOOP_FUTURES.md)
- [Modelo de Atores](ANALISE_ATORES.md)

## Referências

- Chapel Documentation:
  https://chapel-lang.org/docs/

- Chapel Language Specification:
  https://chapel-lang.org/docs/language/spec/

- Actor Oriented Programming in Chapel:
  https://chapel-lang.org/education/cs380p-actors.pdf

- Task Parallelism and Synchronization:
  https://chapel-lang.org/docs/language/spec/task-parallelism-and-synchronization.html

- Iterators e yield:
  https://chapel-lang.org/docs/language/spec/iterators.html

- Data Parallelism:
  https://chapel-lang.org/docs/language/spec/data-parallelism.html

## Integrantes

Eduardo Leal Aruth
Leonardo Rodrigues de Lima
Yasmin Ayumi Foltran Mano