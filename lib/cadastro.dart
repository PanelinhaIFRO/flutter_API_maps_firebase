import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class cadastro extends StatefulWidget {
  @override
  _cadastroState createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {

  TextEditingController _controladorNome = TextEditingController();
  TextEditingController _controladorCPF = TextEditingController();
  TextEditingController _controladorEndereco = TextEditingController();
  TextEditingController _controladorTelefone = TextEditingController();
  TextEditingController _controladorEmail = TextEditingController();

  CollectionReference pessoas = FirebaseFirestore.instance.collection('pessoas');//nome da tabelas que será criada no banco de dados


  String _msgFinal = '';


  Future<void> adicionarPessoa() {
    return pessoas.add({
      'nome':_controladorNome.text.toString(),
      'CPF':_controladorCPF.text.toString(),
      'endereco':_controladorEndereco.text.toString(),
      'telefone':_controladorTelefone.text.toString(),
      'Email':_controladorEmail.text.toString()
    })
        .then((value) => _msgFinal = 'Pessoa adicionada com sucesso!')
        .catchError((onError) => _msgFinal = 'Não foi possível inserir as pessoas!');
  }

  _mostrarSnackBar() {
    final snackBar = SnackBar(
      content: Center(
          child: Text(
            _msgFinal,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          )),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.amber ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text('Faça seu cadastro:',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(
                    labelText: 'Nome Completo'
                ),
              ),
              TextField(
                controller: _controladorCPF,
                decoration: InputDecoration(
                    labelText: 'CPF'
                ),
              ),
              TextField(
                controller: _controladorEndereco,
                decoration: InputDecoration(
                    labelText: 'Endereço'
                ),
              ),
              TextField(
                controller: _controladorTelefone,
                decoration: InputDecoration(
                    labelText: 'Telefone'
                ),
              ),
              TextField(
                controller: _controladorEmail,
                decoration: InputDecoration(
                    labelText: 'E-mail',
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    await adicionarPessoa();
                    _mostrarSnackBar();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.amber) ),
                  child: Text ('Salvar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  ))
            ],
          ),
        ),
      ),

    );
  }
}

