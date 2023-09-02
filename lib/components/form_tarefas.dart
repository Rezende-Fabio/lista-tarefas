import 'package:flutter/material.dart';

class TarefaForm extends StatefulWidget {
  final void Function(String) onSubmit;

  TarefaForm(this.onSubmit);

  @override
  State<TarefaForm> createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final descControler = TextEditingController();


  _submitForm() {
    final desc = descControler.text;

    if (desc.isEmpty) {
      return;
    } else {
      widget.onSubmit(desc);
    }
    
  }

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
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            ElevatedButton(
              child: Text("Inserir"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}