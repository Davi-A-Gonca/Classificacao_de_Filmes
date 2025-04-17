import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void menu() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext cotext) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen>{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notaController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();

  bool texto1 = false;
  bool texto2 = false;
  bool texto3 = false;

  String? _character = null;

  final url = Uri.parse('https://67ffe0cab72e9cfaf7262e15.mockapi.io/notas');

  Future<void> enviarParaAPI(double valor) async {
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nota': valor}),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Enviado com sucesso!');
      } else {
        print('Erro ao enviar: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              ListTile(
              title: const Text('Lafayette'),
              leading: Radio<String>(
                value: "Lafayette",
                groupValue: _character,
                onChanged: (String? value) {
                  setState(() {
                    _character = value;
                    texto1 = true;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Thomas Jefferson'),
              leading: Radio<String>(
                value: "Thomas Jefferson",
                groupValue: _character,
                onChanged: (String? value) {
                  setState(() {
                    _character = value;
                    texto1 = true;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _notaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (String value) async {
                setState( () {
                  if(value.isNotEmpty){
                    final texto = value.replaceAll(',', '.');
                    final nota = double.parse(texto);
                    if(nota >= 0 && nota <= 5)
                      texto2 = true;
                    else
                      texto2 = false;
                  }else
                    texto2 = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nota (entre 0-5)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _comentarioController,
              onChanged: (String value) async {
                setState( () {
                  texto3 = value.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                labelText: 'Comentários:',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: texto1 && texto2 && texto3
                ? () {
                    String nome = _nameController.text;
                    final texto = _notaController.text.replaceAll(',', '.');
                    final nota = double.parse(texto);
                    String comentario = _comentarioController.text;
                    enviarParaAPI(nota);
                    print('$_character');
                    final snackbar = SnackBar (content: const Text('Nota e comentário adicionados :)'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {},
                     ),
                   );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                  : null,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}