import 'dart:convert';

import 'ejercicio.dart';

class Clase {
  Clase({
    this.id,
    this.imagen,
    this.nombre,
    this.descripcion,
    this.diaS,
    this.hora,
    // this.ejercicios,
  });

  String id;
  String imagen;
  String nombre;
  String descripcion;
  String diaS;
  String hora;
  // List<Ejercicio> ejercicios;

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["_id"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        diaS: json["diaS"],
        hora: json["hora"],
        // ejercicios: List<Ejercicio>.from(
        //     json["ejercicios"].map((x) => Ejercicio.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imagen": imagen,
        "nombre": nombre,
        "descripcion": descripcion,
        "diaS": diaS,
        "hora": hora,
        // "ejercicios": List<dynamic>.from(ejercicios.map((x) => x.toJson())),
      };
}
