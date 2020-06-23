import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrsaida extends StatefulWidget {
  @override
  _QrsaidaState createState() => _QrsaidaState();
}

class _QrsaidaState extends State<Qrsaida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRCode saída"),
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
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  data: "true",
                  version: QrVersions.auto,
                  size: 200,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 46),
              child: ClipRRect(
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
                  child:  FlatButton(
                    child: Text("Finalizar"),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            )
          ],
        )

      ),
    );
  }
}
