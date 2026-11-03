use Time;

writeln("Inicio do programa");

sync {
  begin {
    sleep(2);
    writeln("Tarefa concorrente finalizada");
  }

  writeln("Fluxo principal continuou");
}

writeln("Todas as tarefas finalizaram");
