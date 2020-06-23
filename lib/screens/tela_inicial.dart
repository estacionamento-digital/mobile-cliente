import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:pi_park/screens/horario.dart';
import 'package:pi_park/screens/login.dart';
import 'package:pi_park/screens/pagamento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'contatos.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}
var resultado;


class _TelaInicialState extends State<TelaInicial> {
  String resultado = "Resultado";
  ScanResult scanResult;

  Future _lerQr() async{
    try{
      scanResult = await BarcodeScanner.scan();
      setState(() {
        resultado =  scanResult.rawContent;
      });
      _showDialog(context);

    }on PlatformException catch(e){
      if(e.code == BarcodeScanner.cameraAccessDenied){
        setState(() {
          resultado = "Permissão à câmera negada";
        });
      }else{
       setState(() {
         resultado = "Erro desconhecido! $e";
       });
      }
    } on FormatException{
      setState(() {
        resultado = "Você pressionou o botão cedo demais!";
      });
    }catch(e) {
      setState(() {
        resultado = "Erro desconhecido! $e";
      });
    }
  }

  abrirCancela() async {
    Firestore.instance.collection("cancela").document("i8lmwUc59Ptf4Qpp4LgH").setData({"cancela" : "aberta"});
    //Navigator.of(context).pop();
  }
   Widget _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Dados do cliente"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(resultado)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Confirmar"),
              onPressed: (){
                abrirCancela();
                Navigator.pop(context);
              },
            )
          ],

        );
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PI Park"),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
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
              child: Center(
                child: Text("PI Park", style: TextStyle(fontSize: 32),),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.settings),
              title: Text("Configurações", style: TextStyle(fontSize: 18)),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.access_time),
              title: Text("Histórico", style: TextStyle(fontSize: 18)),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.account_box),
              title: Text("Alterar cadastro", style: TextStyle(fontSize: 18)),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.credit_card),
              title: Text("Adicionar cartão", style: TextStyle(fontSize: 18)),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              title: Text("Sair", style: TextStyle(fontSize: 18)),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Login()
                ));
              },
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        backgroundColorStart: Colors.green,
        backgroundColorEnd: Colors.lime,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            title: Text("Home", style: TextStyle(
              color: Colors.black
            ),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.black,),
            title: Text("Info", style: TextStyle(
                color: Colors.black
            ))
          )
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: InkWell(
                      child: Image.asset('qr_code.jpg',),
                      onTap: _lerQr,
                      splashColor: Colors.blue,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    child: InkWell(
                      child: Image.asset('paypal.jpg',),
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pagamento()));
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.width / 4,
                      color: Colors.transparent,
                      child:InkWell(
                        child: Image.asset('ampulheta.png'),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Horario()
                          ));
                        },
                      )
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.width / 4,
                      color: Colors.transparent,
                      child:InkWell(
                        child: Image.asset('contato.jpg'),
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => Contatos()
                          )
                          );
                        },
                      )
                  ),
                )
              ],
            ),
           /* resultado != "Resultado" ?
            : Container(
              color: Colors.transparent,
            )*/
          ],
        ),
      ),
    );
  }
}
