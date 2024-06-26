import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class DetalhesTarefa extends StatefulWidget {
  final Tarefa tarefa;
  final Function(Tarefa) onUpdate; // Função para atualizar a tarefa

  const DetalhesTarefa(
      {super.key, required this.tarefa, required this.onUpdate});

  @override
  _DetalhesTarefaState createState() => _DetalhesTarefaState();
}

class _DetalhesTarefaState extends State<DetalhesTarefa> {
  late TextEditingController _tituloController;
  late TextEditingController _descricaoController;
  bool _alteracoesSalvas =
      true; // Variável para rastrear se as alterações foram salvas

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.tarefa.titulo);
    _descricaoController = TextEditingController(text: widget.tarefa.descricao);
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  // Método para exibir o AlertDialog
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Descartar Alterações?"),
          content: const Text(
              "Tem certeza que deseja descartar as alterações feitas nesta tarefa?"),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fecha o AlertDialog
                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Adiciona um espaço entre os botões
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fecha o AlertDialog
                      Navigator.pop(context); // Fecha a tela de DetalhesTarefa
                    },
                    child: const Text(
                      "Descartar",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Método para salvar as alterações
  void _saveChanges() {
    // Salvar as alterações
    final novoTitulo = _tituloController.text;
    final novaDescricao = _descricaoController.text;
    // Atualizar a tarefa com os novos valores
    final novaTarefa = Tarefa(
      id: widget.tarefa.id,
      titulo: novoTitulo,
      descricao: novaDescricao.isNotEmpty ? novaDescricao : null,
      isDone: widget.tarefa.isDone,
      dataCriacao: widget.tarefa.dataCriacao,
    );
    // Atualizar a tarefa na lista ou no banco de dados
    // Chamando a função onUpdate passada como parâmetro
    widget.onUpdate(novaTarefa);
    // Exibir um SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarefa atualizada')),
    );
    setState(() {
      _alteracoesSalvas = true; // Marcando as alterações como salvas
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!_alteracoesSalvas) {
          // Se as alterações não foram salvas, exibe o AlertDialog
          _showAlertDialog();
          return false; // Impede o retorno automático
        }
        return true; // Permite o retorno automático
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detalhes da Tarefa',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white, size: 24),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (!_alteracoesSalvas) {
                // Se as alterações não foram salvas, exibe o AlertDialog
                _showAlertDialog();
              } else {
                Navigator.pop(context); // Fecha a tela de DetalhesTarefa
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveChanges, // Chama o método _saveChanges
            ),
          ],
        ),
        body: SingleChildScrollView(
          // Adicionando SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Título:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _tituloController,
                  onChanged: (_) {
                    setState(() {
                      _alteracoesSalvas =
                          false; // Marcando as alterações como não salvas
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite o título',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Descrição:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descricaoController,
                  onChanged: (_) {
                    setState(() {
                      _alteracoesSalvas =
                          false; // Marcando as alterações como não salvas
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Digite a descrição',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Status:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.tarefa.isDone ? 'Concluído' : 'Pendente',
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.tarefa.isDone ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Data de Criação:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.tarefa.dataCriacao.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
