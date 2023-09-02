import 'package:flutter/material.dart';
import '../models/Tarefa.dart';
import 'package:intl/intl.dart';

class ListaTarefas extends StatefulWidget {
  final List<Tarefa> tarefas;

  ListaTarefas(this.tarefas);

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  bool marcado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      child: ListView.builder(
        itemCount: widget.tarefas.length,
        itemBuilder: (ctx, index) {
          final tr = widget.tarefas[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Card(
              elevation: 15,
              color: Colors.amber,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.desc,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(
                          DateFormat("dd/MM/y HH:MM").format(tr.data),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.blue,
                    value: marcado,
                    onChanged: (bool? value) {
                      setState(() {
                        marcado = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
