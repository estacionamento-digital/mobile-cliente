import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pi_park/screens/qr_saida.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  String pagamento = "false";

  efetuarPagamento(){
    Timer(Duration (seconds: 2,), (){
     return CircularProgressIndicator();
    });
    setState(() {
      pagamento = "true";
    });
  }
  gerarQr(){
    return QrImage(
      data: "true",
      version: QrVersions.auto,
      size: 200,
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento"),
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
        child:

           Padding(
             padding: EdgeInsets.only(top: 45, left: 30),
             child: Column(
               children: <Widget>[
                 Divider(),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text("Estacionamento IEL", style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),),
                     ],
                   ),
                 Divider(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     Text("Av. Rui Barbosa, 5881", style: TextStyle(
                         fontSize: 14
                     ),
                     ),
                      Text("Tel: (41) 2104-6828", style: TextStyle(
                           fontSize: 14
                       ),),

                   ],
                 ),

                Divider(),
                  Row(
                    children: <Widget>[
                      Text("Email: faculdadedaindustriaiel@sistemafiep.org.br" , style: TextStyle(
                          fontSize: 14
                      )),
                    ],
                  ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 26),
                  child:  Row(
                    children: <Widget>[
                      Text("Tempo total: 2:34:23", style:
                      TextStyle(fontSize: 20)
                      )
                    ],
                  ),
                ),
                 Padding(
                   padding: EdgeInsets.only(top: 26),
                   child: Row(
                     children: <Widget>[
                       Text("Valor: R\$35,00", style:
                       TextStyle(fontSize: 20)),
                     ],
                   ),
                 ),
                Padding(
                  padding: EdgeInsets.only(top: 26),
                  child:  Row(
                    children: <Widget>[
                      Text("Cartao: ****.****.2345", style:
                      TextStyle(fontSize: 20))
                    ],
                  ),

                ),
                 pagamento == "true" ?
                    Padding(padding: EdgeInsets.only(top: 38),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Pagamento Efetuado com sucesso",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            color: Colors.green
                          ),
                        ),
                      ],
                    )
                    )
                     : Container(),
                 Padding(
                   padding: EdgeInsets.only(top: 40),
                   child:  ClipRRect(
                     borderRadius: BorderRadius.circular(70),
                     child:  Container(
                       width: MediaQuery.of(context).size.width / 2,
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
                       child: pagamento == "false" ?
                       FlatButton(
                         child: Text("Efetuar pagamento"),
                         onPressed: efetuarPagamento,
                       ) :  FlatButton(
                         child: Text("Gerar QRCode para saída"),
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) => Qrsaida()
                           )
                           );
                         },
                       ),

                     ),
                   ),
                 )
               ],
             )
           )


      ),
    );
  }
}
