var mensagem: sync string;
var resposta: sync string;

cobegin {
  {
    // Ator A
    writeln("Ator A: enviando mensagem");
    mensagem.writeEF("Ola, Ator B!");

    var retorno = resposta.readFE();
    writeln("Ator A recebeu: ", retorno);
  }

  {
    // Ator B
    var recebida = mensagem.readFE();
    writeln("Ator B recebeu: ", recebida);

    resposta.writeEF("Mensagem recebida!");
  }
}

writeln("Comunicacao entre atores finalizada");