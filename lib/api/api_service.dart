import 'dart:convert';
import 'package:flutter_application_gym/models/clase.dart';
import 'package:flutter_application_gym/models/ejercicio.dart';
import 'package:flutter_application_gym/models/usuario_list.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://192.168.1.45:3000";

  login(String email, String password) async {
    var respuesta = await http.post(
      Uri.parse("$apiUrl/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    final datos = json.decode(respuesta.body);

    if (datos['ok'] == true) {
      print('bien');
      print(datos);
      return datos;
    } else {
      print('mal');
      print(datos);
      return "Tenemos un fallo en el Servidor";
    }
  }

  registro(String nombre, String email, String password) async {
    Map datos = {
      'nombre': nombre,
      'email': email,
      'password': password,
    };

    final http.Response respuesta = await http.post(
      Uri.parse("$apiUrl/usuarios"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(datos),
    );

    final data = json.decode(respuesta.body);

    if (data['ok'] == true) {
      // print('bien');
      // print(data);
      return "Usuario Registrado";
    } else {
      // print('mal');
      // print(data);
      return "Tenemos un fallo en el Servior";
    }
  }

  Future<List<Clase>> getUsuarioPopulate(String id) async {
    http.Response res = await http.get(Uri.parse("$apiUrl/usuarios/total/$id"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Clase> clases =
          body.map((dynamic item) => Clase.fromJson(item)).toList();
      return clases;
    } else {
      print(res);
      throw "Error al cargar el usuario";
    }
  }

  // Future<Usuario> getUsuarioPopulate(String id) async {
  //   http.Response res = await http.get(Uri.parse("$apiUrl/usuarios/total/$id"));
  //   if (res.statusCode == 200) {
  //     var body = jsonDecode(res.body);
  //     Usuario usuario =
  //         body.map((dynamic item) => Usuario.fromJson(item)).toList();
  //     return usuario;
  //   } else {
  //     print(res);
  //     throw "Error al cargar el usuario";
  //   }
  // }

  Future<List<Clase>> getAllClases() async {
    http.Response res = await http.get(Uri.parse("$apiUrl/clases"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Clase> clases =
          body.map((dynamic item) => Clase.fromJson(item)).toList();
      return clases;
    } else {
      throw "Error en la lista de Clases";
    }
  }

  Future<List<UsuarioList>> getAllAlumnos() async {
    http.Response res = await http.get(Uri.parse("$apiUrl/usuarios/user"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UsuarioList> usuarios =
          body.map((dynamic item) => UsuarioList.fromJson(item)).toList();
      return usuarios;
    } else {
      throw "Error en la lista de Usuarios";
    }
  }

  Future<List<UsuarioList>> getAllProfesores() async {
    http.Response res = await http.get(Uri.parse("$apiUrl/usuarios/profesor"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<UsuarioList> usuarios =
          body.map((dynamic item) => UsuarioList.fromJson(item)).toList();
      return usuarios;
    } else {
      throw "Error en la lista de Entrenadores";
    }
  }

  Future<List<Ejercicio>> getAllEjercicios(String id) async {
    http.Response res = await http.get(Uri.parse("$apiUrl/clases/total/$id"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Ejercicio> ejer =
          body.map((dynamic item) => Ejercicio.fromJson(item)).toList();
      return ejer;
    } else {
      print(res);
      throw "Error en la lista de Ejercicios";
    }
  }
  // Future<List<Clase>> getUsuarioPopulate(String id) async {
  //   http.Response res = await http.get(Uri.parse("$apiUrl/usuarios/total/$id"));
  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);
  //     List<Clase> clases =
  //         body.map((dynamic item) => Clase.fromJson(item)).toList();
  //     return clases;
  //   } else {
  //     print(res);
  //     throw "Error al cargar el usuario";
  //   }
  // }
}
