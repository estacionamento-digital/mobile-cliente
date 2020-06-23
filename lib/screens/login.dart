
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pi_park/screens/cadastro.dart';
import 'package:pi_park/screens/tela_inicial.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "E-mail",
                      focusColor: Colors.white,
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

              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextFormField(
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
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child:  Container(
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
                    child: Text("Entrar"),
                    onPressed: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> TelaInicial()));
                    },
                  ),
                ),
              )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 35 ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Não tem conta? Cadastre-se!",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Cadastro()
                    )
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
