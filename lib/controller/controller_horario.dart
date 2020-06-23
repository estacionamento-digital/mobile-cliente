
import 'package:cloud_firestore/cloud_firestore.dart';

class ControleHorario{
  DateTime horaEntrada;
  DateTime tempoDecorrido;
  DateTime horaSaida;

  String calcularHorario(){
    horaEntrada = DateTime.now();
    return horaEntrada.toString();
  }
}