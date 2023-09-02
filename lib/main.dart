import 'package:flutter/material.dart';
import './models/Tarefa.dart';
import './components/lista_tarefas.dart';
import 'dart:math';
import './components/form_tarefas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 45, 170, 247)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tarefas = [
    Tarefa(
      id: 1,
      desc: "Ir no Mercado",
      data: DateTime.now(),
    ),
    Tarefa(
      id: 2,
      desc: "Pagar a Conta de Luz",
      data: DateTime.now(),
    ),
  ];

  _addTarefa(String desc) {
    final novaTarefa = Tarefa(
        id: Random().nextDouble().toInt(), desc: desc, data: DateTime.now());

    setState(() {
      _tarefas.add(novaTarefa);
    });

    Navigator.of(context).pop();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.green,
            contentTextStyle: const TextStyle(
              color: Colors.white,
            ),
            titleTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            title: const Text("Aviso"),
            content: const Text("Tarefa inserida com sucesso!"),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              )
            ],
          );
        });
  }

  _abrirModalFormTarefa(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TarefaForm(_addTarefa);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Lista de Tarefas"),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.account_box_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, child: Text("TESTE"), elevation: 5),
            ),
            ListaTarefas(_tarefas),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirModalFormTarefa(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
