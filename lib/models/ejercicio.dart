import 'dart:convert';

class Ejercicio {
  Ejercicio({
    this.id,
    this.nombre,
    this.link,
    this.detalle,
  });

  String id;
  String nombre;

  String link;
  String detalle;

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        id: json["_id"],
        nombre: json["nombre"],
        link: json["link"],
        detalle: json["detalle"] == null ? null : json["detalle"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "link": link,
        "detalle": detalle == null ? null : detalle,
      };
}
