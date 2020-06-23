import 'package:flutter/material.dart';

class Contatos extends StatefulWidget {
  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Idealizadores do projeto", style: TextStyle(
                    fontSize: 24,
                    color: Colors.green
                ),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Wilson Caleb Perepelecia", style: TextStyle(
                    fontSize: 16
                  ),),
                )
              ],
            )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("linkedin.com/in/wilson-caleb-a40b7513b/"),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("wilsonperepelecia@gmail.com"),
                  )
                ],
              )
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Gustavo Rattman", style: TextStyle(fontSize: 16),),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("linkedin.com/in/gustavorattmann/"),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("gustavo_rattmann@hotmail.com.br"),
                  )
                ],
              )
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Marcos Antonio de Faria", style: TextStyle(fontSize: 16),),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("linkedin.com/in/marcos-antonio-de-faria-086627142/"),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("marcosgt9@gmail.com"),
                  )
                ],
              )
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Bruno Bianchi Gonzaga", style: TextStyle(fontSize: 16),),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("linkedin.com/in/bruno-gonzaga-031816b1/"),
                  )
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("bruno.b.gonzaga@hotmail.com"),
                  )
                ],
              )
          ),
          Divider(),
        ],
      ),
    );
  }
}
