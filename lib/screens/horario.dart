import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pi_park/controller/controller_horario.dart';

class Horario extends StatefulWidget {
  @override
  _HorarioState createState() => _HorarioState();
}

class _HorarioState extends State<Horario> {

  String horarioEntrada = "";
  ControleHorario controleHorario = ControleHorario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Horário"),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Estacionamento IEL",
                    style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),)
                )
              ],
            ),
            Divider(),
               Padding(
                 padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                 child:  Row(
                   children: <Widget>[
                     Text("Entrada: ", style: TextStyle(fontSize: 18),),
                     Padding(padding: EdgeInsets.only(left: 20),
                     child: Text("12:56:13", style: TextStyle(fontSize: 18),),)
                   ],
                 ),
               ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Text("Tempo decorrido: ", style: TextStyle(fontSize: 18),),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("1:45:23", style: TextStyle(fontSize: 18),),
                    )
                  ],
                ),
              ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Text("Sub-total: ", style: TextStyle(fontSize: 18),),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("R\$12,50", style: TextStyle(fontSize: 18),),
                  ),
                ],
              )
            ),
            Divider()
              ],
            )
      ),
    );
  }
}
