import 'package:final_api_maps_firebase/cadastro.dart';
import 'package:final_api_maps_firebase/cotacoes.dart';
import 'package:final_api_maps_firebase/onde_estamos.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'Post.dart';
import 'package:http/http.dart' as http;


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

//teste push

class _homeState extends State<home> {

  //link para abrir o Youtube
  abrirYoutube() async{
    await launch('https://www.youtube.com/watch?v=ZoXQYX6HFMM&list=PLgGNW6TxMJVzUAPAPKCg49cUNRtqE4Wpw&ab_channel=Usecripto');
  }

  //Rest Api
  List<Post> postagens = [];

  Future<List<Post>> _recuperarObjetos () async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    http.Response response = await http.get(url);
    var respostas = json.decode(response.body);
    for(var resposta in respostas){
      Post p = Post(resposta["userId"], resposta["id"], resposta["title"], resposta["body"]);
      postagens.add(p);
    }
    print(postagens.length);
    print(response.statusCode);
    return Navigator.push(context, MaterialPageRoute(builder: (context) => cotacoes(postagens)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Text(
            'Preço de cotaçoes:',
            style: TextStyle(
                color: Colors.black
            ),
          ),
        ),

        body: SingleChildScrollView(

          child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Center(
                    child: Text ("CAMBIOCÓ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => onde_estamos()));
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  ('https://images.pexels.com/photos/2432221/pexels-photo-2432221.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text ("Encontre-nos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),


                      Column(
                        children: [
                          GestureDetector(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => cadastro()));
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  ('https://images.pexels.com/photos/4792285/pexels-photo-4792285.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text ("Cadastre-se",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await _recuperarObjetos();
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  ('https://images.pexels.com/photos/6771985/pexels-photo-6771985.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text ("Cotações",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),


                      Column(
                        children: [
                          GestureDetector(
                            onTap:() {
                              abrirYoutube();
                            },
                            child: ClipOval(
                              child: Image(
                                image: NetworkImage
                                  ('https://images.pexels.com/photos/6801648/pexels-photo-6801648.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text ("Aprenda mais",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  ),
                ),



              ]
          ),
        ),

    );
  }
}


