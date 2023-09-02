import 'package:flutter/material.dart';
import '../models/Tarefa.dart';
import 'package:intl/intl.dart';

class ListaTarefas extends StatelessWidget {
  final List<Tarefa> tarefas;

  ListaTarefas(this.tarefas);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (ctx, index) {
          final tr = tarefas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    tr.desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr.desc,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat("d MMM y").format(tr.data),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
