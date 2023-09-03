import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final descControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
                controller: descControler,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  prefixIcon: Icon(Icons.account_circle_outlined),
                )),
            TextField(
              controller: descControler,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Telefone",
                prefixIcon: Icon(Icons.call),
              ),
            ),
            TextField(
              controller: descControler,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Nascimento",
                prefixIcon: Icon(Icons.date_range),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                  child: const Text("Inserir"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple),
                  onPressed: () => {}),
            ),
          ],
        ),
      ),
    );
  }
}
