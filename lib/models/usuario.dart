import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario{
  String nome;
  String telefone;
  String placa;
  String email;


  Usuario(this.nome, this.telefone, this.placa, this.email);

  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
  toJson() => _$UsuarioToJson(this);
}