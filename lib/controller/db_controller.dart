import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Controller{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;

  cadastrarUsuario(String email, String senha){
  firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
}

salvarDados(Map json)async{
  await firestore.collection("usuarios").add(json);
}
}