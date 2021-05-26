import 'dart:convert';

class Clase {
  Clase({
    this.id,
    this.imagen,
    this.nombre,
    this.descripcion,
    this.diaS,
    this.hora,
  });

  String id;
  String imagen;
  String nombre;
  String descripcion;
  String diaS;
  String hora;

  factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["_id"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        diaS: json["diaS"],
        hora: json["hora"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imagen": imagen,
        "nombre": nombre,
        "descripcion": descripcion,
        "diaS": diaS,
        "hora": hora,
      };
}
