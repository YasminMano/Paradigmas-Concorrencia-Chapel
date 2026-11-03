use Time;

var mensagem: sync int;

cobegin {
  {
    sleep(2);
    writeln("Produtor: enviando o valor 42");
    mensagem.writeEF(42);
  }

  {
    writeln("Consumidor: aguardando mensagem...");
    var valor = mensagem.readFE();
    writeln("Consumidor: recebeu ", valor);
  }
}

writeln("Comunicacao finalizada");
