class Tarefa {
  String id;
  String titulo;
  String descricao;
  DateTime dataCriacao;
  bool isDone;

  Tarefa({
    String? id,
    String? titulo,
    String? descricao,
    DateTime? dataCriacao,
    this.isDone = false,
  })  : id = id ?? '',
        titulo = titulo ?? '',
        descricao = descricao ?? '',
        dataCriacao = dataCriacao ?? DateTime.now();

  static List<Tarefa> listaTarefa() {
    return [
      Tarefa(
        id: '01',
        titulo: 'Comprar arroz',
        descricao: 'Ir ao supermercado e comprar arroz',
        dataCriacao: DateTime.now(),
        isDone: true,
      ),
      Tarefa(
        id: '02',
        titulo: 'Estudar Programação',
        descricao: 'Estudar programação por pelo menos uma hora',
        dataCriacao: DateTime.now(),
      ),
      Tarefa(
        id: '03',
        titulo: 'Reunião',
        descricao: 'Participar da reunião de equipe às 14:00',
        dataCriacao: DateTime.now(),
        isDone: true,
      ),
      Tarefa(
        id: '04',
        titulo: 'Passear',
        descricao: 'Dar um passeio no parque pela manhã',
        dataCriacao: DateTime.now(),
      ),
      Tarefa(
        id: '05',
        titulo: 'Ir ao banco',
        descricao: 'Ir ao banco para resolver questões financeiras',
        dataCriacao: DateTime.now(),
      ),
    ];
  }
}
