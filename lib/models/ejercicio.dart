import 'dart:convert';

class Ejercicio {
  Ejercicio({
    this.id,
    this.nombre,
    this.ejercicios,
    this.link,
    this.detalle,
  });

  String id;
  String nombre;
  List<Ejercicio> ejercicios;
  String link;
  String detalle;

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        id: json["_id"],
        nombre: json["imagen"],
        ejercicios: List<Ejercicio>.from(
            json["ejercicios"].map((x) => Ejercicio.fromJson(x))),
        link: json["link"],
        detalle: json["detalle"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "ejercicios": List<dynamic>.from(ejercicios.map((x) => x.toJson())),
        "link": link,
        "detalle": detalle,
      };
}
