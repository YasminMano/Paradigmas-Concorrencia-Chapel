
# Modelo de Atores em Chapel

## 1. O que é o modelo de Atores?

O modelo de Atores é uma abordagem de concorrência na qual unidades independentes, chamadas atores, possuem estado próprio e se comunicam por mensagens.

Em um sistema de atores, cada ator pode receber mensagens, processá-las e enviar respostas.

## 2. Chapel possui suporte nativo?

Chapel utiliza principalmente concorrência baseada em tarefas (tasks), com construções como `begin`, `cobegin` e `coforall`.

Na documentação oficial do Chapel 2.10 consultada, não foi identificado um módulo padrão Actors.

Isso não significa que o modelo seja impossível de implementar na linguagem.


## 3. Investigação de bibliotecas

Para verificar a disponibilidade de bibliotecas relacionadas ao modelo de Atores, consultamos o registro de pacotes do Chapel por meio do Mason.

Foram utilizados os comandos:

```bash
mason search actor
mason search actors
mason search
```

A consulta geral retornou 21 pacotes, entre eles DataStructures, LocalAtomics e Logging.

Nas consultas realizadas, não encontramos pacotes relacionados ao modelo de Atores pelos termos actor e actors. A listagem geral do Mason também não apresentou bibliotecas identificadas explicitamente com esse modelo.

Isso indica que, no registro consultado, não foi identificada uma biblioteca dedicada especificamente ao modelo de Atores.

Essa verificação não descarta a existência de implementações externas ao Mason.

Também encontramos o estudo acadêmico "Actor Oriented Programming in Chapel", de Amin Shali (2010), que investiga o uso desse modelo na linguagem.

O estudo demonstra a possibilidade de explorar o modelo de Atores em Chapel, mas não confirma a existência de uma biblioteca oficial mantida para a versão 2.10.0.

## 4. Demonstração prática

Arquivo: 11_modelo_atores.chpl

O programa implementa duas tarefas concorrentes, denominadas Ator A e Ator B.

A comunicação ocorre por variáveis sync string:

- O Ator A envia uma mensagem.
- O Ator B recebe a mensagem.
- O Ator B envia uma resposta.
- O Ator A recebe a resposta.

Essa é uma implementação didática inspirada no modelo de Atores, e não um framework completo.

## 5. Limitações da implementação

O exemplo não implementa:

- Caixas de mensagens com múltiplos elementos.
- Isolamento formal do estado dos atores.
- Gerenciamento do ciclo de vida dos atores.
- Supervisão e tratamento de falhas entre atores.

## 6. Conclusão

Chapel não depende do modelo de Atores para oferecer concorrência.

Embora não tenha sido identificado um módulo padrão dedicado a Atores, seus mecanismos de tarefas e sincronização permitem implementar padrões de comunicação por mensagens.

O exemplo desenvolvido demonstra essa possibilidade, mas não constitui uma implementação completa do modelo de Atores.

## Referências

CHAPEL. Documentação oficial, versão 2.10.
https://chapel-lang.org/docs/

SHALI, Amin. Actor Oriented Programming in Chapel.
2010.
https://chapel-lang.org/education/cs380p-actors.pdf
