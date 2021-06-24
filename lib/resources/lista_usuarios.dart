//import 'package:campusflutter/pages/temario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gym/models/usuario_list.dart';

class ListaUsarios extends StatelessWidget {
  final List<UsuarioList> usuarios;
  ListaUsarios({Key key, this.usuarios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios == null ? 0 : usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
                child: ClipOval(
              child: usuarios[index].img == null || usuarios[index].img == ""
                  ? Image.asset("assets/images/user.png", fit: BoxFit.cover)
                  : Image.network(
                      "http://192.168.1.46:3000/img/${usuarios[index].img}",
                      fit: BoxFit.cover),
            )),
            title: Text(usuarios[index].nombre),
            subtitle: Text(usuarios[index].email),
          );
        });
  }
}
