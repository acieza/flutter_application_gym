import 'package:flutter_application_gym/models/clase.dart';

class Usuario {
  Usuario({
    this.role,
    this.clases,
    this.id,
    this.nombre,
    this.email,
    this.password,
  });

  String role;
  List<Clase> clases;
  String id;
  String nombre;
  String email;
  String password;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        role: json["role"],
        clases: List<Clase>.from(json["clases"].map((x) => Clase.fromJson(x))),
        id: json["_id"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "clases": List<dynamic>.from(clases.map((x) => x.toJson())),
        "_id": id,
        "nombre": nombre,
        "email": email,
        "password": password,
      };
}
