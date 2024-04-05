import 'package:flutter/material.dart';
import '../telas/info.dart';
import '../widgets/item.dart';
import '../models/tarefa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Função de dar check nas tarefas
  void _mudarEstado(Tarefa tarefa) {
    setState(() {
      tarefa.isDone = !tarefa.isDone;
    });
  }

  // Apagar com base no id
  void _deleteItem(String? id) {
    setState(() {
      listaTarefa.removeWhere((tarefa) => tarefa.id == id);
    });
  }

  // Adicionar tarefa nova
  void _addItem(String tarefa) {
    setState(() {
      listaTarefa.add(
        Tarefa(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          titulo: tarefa,
          descricao: '', // Forneça uma descrição padrão aqui
          dataCriacao: DateTime.now(), // Use a data atual como data de criação
        ),
      );
    });
    _controller.clear();
  }

  // Atualizar tarefa
  void _atualizarTarefa(Tarefa tarefaAtualizada) {
    setState(() {
      int index = listaTarefa
          .indexWhere((element) => element.id == tarefaAtualizada.id);
      if (index != -1) {
        listaTarefa[index] = tarefaAtualizada;
      }
    });
  }

  final listaTarefa = Tarefa.listaTarefa();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Informações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Info()),
                );
              },
            ),
          ],
        ),
      ),

      // Lista de tarefas e outros widgets empilhados
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listaTarefa.length,
            itemBuilder: (BuildContext context, int index) {
              return Item(
                tarefa: listaTarefa[index],
                tarefaMuda: _mudarEstado,
                deleteTarefa: _deleteItem,
                onUpdate:
                    _atualizarTarefa, // Passando a função _atualizarTarefa
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // Se houver algum conteúdo a ser exibido dentro do Container, adicione aqui
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          hintText: 'Adicione uma nova tarefa',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addItem(_controller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
