import 'package:flutter/material.dart';
import 'package:flutter_application_gym/api/api_service.dart';
import 'package:flutter_application_gym/models/ejercicio.dart';
import 'package:flutter_application_gym/pages/video.dart';

class Ejercicios extends StatefulWidget {
  Ejercicios({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _EjerciciosState createState() => _EjerciciosState();
}

class _EjerciciosState extends State<Ejercicios> {
  Future<List<Ejercicio>> ejercicios;
  ApiService api = ApiService();

  @override
  void initState() {
    ejercicios = api.getAllEjercicios(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Ejercicios'),
      ),
      body: Container(
          //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.black,
          child: (ejercicios == null)
              ? Center(
                  child: Text("No hay ejercicios disponibles",
                      style: TextStyle(color: Colors.white)),
                )
              : FutureBuilder<List<Ejercicio>>(
                  future: ejercicios,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount:
                              snapshot.data == null ? 0 : snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Text(
                                      "Ejercicios de: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Video(
                                                        link: snapshot
                                                            .data[index].link,
                                                        detalle: snapshot
                                                            .data[index]
                                                            .detalle,
                                                      )));
                                        },
                                        child: ListTile(
                                          title: Text(
                                              snapshot.data[index].nombre,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          trailing: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    }

                    return Center(child: CircularProgressIndicator());
                  })),
    );
  }
}
