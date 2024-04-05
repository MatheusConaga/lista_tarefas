import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../telas/detalhes_tarefa.dart';

class Item extends StatelessWidget {
  final Tarefa tarefa;
  final Function(Tarefa) tarefaMuda;
  final Function(String?) deleteTarefa;
  final Function(Tarefa) onUpdate;

  const Item({
    Key? key,
    required this.tarefa,
    required this.tarefaMuda,
    required this.deleteTarefa,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesTarefa(
                tarefa: tarefa,
                onUpdate: onUpdate,
              ),
            ),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        tileColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            if (!tarefa.isDone) {
              // Exibe uma caixa de diálogo de confirmação antes de marcar a tarefa como concluída
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmar conclusão"),
                    content: Text("Tem certeza que deseja marcar esta tarefa como concluída?"),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha a caixa de diálogo
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Adiciona um espaço entre os botões
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                tarefaMuda(tarefa); // Marca a tarefa como concluída
                                Navigator.pop(context); // Fecha a caixa de diálogo
                              },
                              child: Text(
                                "Concluir",
                                style: TextStyle(color: Colors.green), // Cor verde
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            } else {
              tarefaMuda(tarefa);
            }
          },
          child: Icon(
            tarefa.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tarefa.isDone ? Colors.green : Colors.grey,
            size: 35,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhesTarefa(
                  tarefa: tarefa,
                  onUpdate: onUpdate,
                ),
              ),
            );
          },
          child: Text(
            tarefa.titulo!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: tarefa.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: () {
              // Exibe uma caixa de diálogo de confirmação antes de excluir a tarefa
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmar exclusão"),
                    content: Text("Tem certeza que deseja excluir esta tarefa?"),
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha a caixa de diálogo
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // Adiciona um espaço entre os botões
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                deleteTarefa(tarefa.id); // Exclui a tarefa
                                Navigator.pop(context); // Fecha a caixa de diálogo
                              },
                              child: Text(
                                "Apagar",
                                style: TextStyle(color: Colors.red), // Cor vermelha
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
