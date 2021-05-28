import 'package:flutter/material.dart';
import 'package:flutter_application_gym/models/clase.dart';

class ListaClases extends StatelessWidget {
  final List<Clase> clases;
  const ListaClases({Key key, this.clases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: clases == null ? 0 : clases.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => Ejercicios(id: clases[index].id)));
            // },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 260,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          margin: EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: clases[index].imagen == null ||
                                    clases[index].imagen == ""
                                ? Image.asset("assets/images/default2.jpg",
                                    fit: BoxFit.cover)
                                : Image.network(
                                    "http://192.168.1.130:3000/imgClase/${clases[index].imagen}",
                                    fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                            width: 160,
                            child: Text(clases[index].nombre,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)))
                      ]),
                ),
                Container(
                  width: 300,
                  child: Column(children: <Widget>[
                    Container(
                      width: 300,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Día: ${clases[index].diaS}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.black54,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    " ${clases[index].hora}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.black54,
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
