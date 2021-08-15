import 'package:final_api_maps_firebase/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class cotacoes extends StatefulWidget {
  List<Post> postagens;
  cotacoes(this.postagens);

  @override
  _cotacoesState createState() => _cotacoesState();
}

class _cotacoesState extends State<cotacoes> {

  List _itens = [];

  _carregarItens(){
    for(var postagem in widget.postagens){
      Map<String, dynamic> item = Map();
      item["userId"] = postagem.userId;
      item["id"] = postagem.id;
      item["title"] = postagem.title;
      item["body"] = postagem.body;
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotações:'),
      ),
      body: ListView.builder(
          itemCount: widget.postagens.length,
          itemBuilder: (context, indice){
            return ListTile(
              title: Text(_itens[indice]['id'].toString() + '-' +_itens[indice]["title"]),
              subtitle: Text(_itens[indice]['body']),
            );
          }),
    );
  }
}
