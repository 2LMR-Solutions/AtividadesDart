class Tarefa {
  String titulo;
  bool concluida;

  Tarefa(this.titulo, {this.concluida = false});

  @override
  String toString() {
    return 'Título: $titulo | Concluída: ${concluida ? 'Sim' : 'Não'}';
  }
}
