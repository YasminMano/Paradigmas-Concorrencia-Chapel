// Simulacao didatica de despacho de eventos.
// Nao representa um event loop assincrono nativo de Chapel.
// A comunicacao utiliza uma variavel sync bloqueante.

use Time;

// Canal de comunicacao entre tarefas
var canal: sync string;

// Processa um evento recebido
proc processarEvento(evento: string) {
  writeln("Despachante: processando ", evento);
  sleep(1);
  writeln("Despachante: finalizou ", evento);
}

writeln("Iniciando sistema de eventos");

cobegin {
  // Tarefa produtora
  {
    for evento in ["Login", "Pagamento", "Notificacao"] {
      writeln("Produtor: enviando ", evento);
      canal.writeEF(evento);
    }

    canal.writeEF("SAIR");
  }

  // Tarefa consumidora
  {
    var executando = true;

    while executando {
      const evento = canal.readFE();

      if evento == "SAIR" {
        executando = false;
      } else {
        processarEvento(evento);
      }
    }
  }
}

writeln("Sistema de eventos encerrado");