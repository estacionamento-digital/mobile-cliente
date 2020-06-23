
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pi_park/controller/db_controller.dart';
import 'package:pi_park/models/usuario.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  Controller controller = Controller();
  bool cadastrou = false;

  salvarUsuario() async{
  FirebaseAuth auth = FirebaseAuth.instance;
  String nome = nomeController.text;
  String telefone = telefoneController.text;
  String placa = placaController.text;
  String email = emailController.text;
  String senha = senhaController.text;

  Usuario usuario = Usuario(nome, telefone, placa, email);

  Map usuarioJson = usuario.toJson();
  controller.salvarDados(usuarioJson);
  auth.createUserWithEmailAndPassword(email: email, password: senha);
  setState(() {
    cadastrou = true;
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.green,
                    Colors.lime
                  ]
              )
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.green,
              Colors.white
            ]
        )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child:  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        hintText: "Nome",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.green),

                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)

                        ),
                        filled: true,
                        fillColor:Colors.green.withOpacity(0.3),

                      ),
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                      controller: telefoneController,
                      decoration: InputDecoration(
                        hintText: "Telefone",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.green),

                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)

                        ),
                        filled: true,
                        fillColor:Colors.green.withOpacity(0.3),

                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                      controller: placaController,
                      decoration: InputDecoration(
                        hintText: "Placa do veículo",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.green),

                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)

                        ),
                        filled: true,
                        fillColor:Colors.green.withOpacity(0.3),

                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25),
                          borderSide:BorderSide(color: Colors.green),

                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)

                        ),
                        filled: true,
                        fillColor:Colors.green.withOpacity(0.3),

                      ),
                    ),
                  )
                ],
              ),
            ),
           Padding(
             padding: EdgeInsets.only(top: 12),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   width: MediaQuery.of(context).size.width - 30,
                   child: TextField(
                     controller: senhaController,
                     obscureText: true,
                     decoration: InputDecoration(
                       hintText: "Senha",
                       enabledBorder: OutlineInputBorder(
                         borderRadius:BorderRadius.circular(25),
                         borderSide:BorderSide(color: Colors.green),

                       ),
                       focusedBorder:OutlineInputBorder(
                           borderSide:BorderSide(color: Colors.white),
                           borderRadius: BorderRadius.circular(25)

                       ),
                       filled: true,
                       fillColor:Colors.green.withOpacity(0.3),

                     ),
                   ),
                 )
               ],
             ),
           ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child:  Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Colors.green,
                                Colors.lime
                              ]
                          )
                      ),
                      child:  FlatButton(
                        child: Text("Cadastrar", style: TextStyle(fontSize: 18),),
                        onPressed:(){
                          salvarUsuario();
                          if(cadastrou){
                            Navigator.pop(context);
                          }
                        }

                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
