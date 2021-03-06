import 'package:flutter/material.dart';
import 'package:flutter_application_gym/api/api_service.dart';
import 'package:flutter_application_gym/auth_b/auth_bloc.dart';
import 'package:flutter_application_gym/models/usuario_list.dart';
import 'package:flutter_application_gym/pages/user.dart';
import 'package:flutter_application_gym/resources/drawer_admin.dart';
import 'package:flutter_application_gym/resources/lista_usuarios.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminU extends StatefulWidget {
  AdminU({Key key}) : super(key: key);

  @override
  _AdminUState createState() => _AdminUState();
}

class _AdminUState extends State<AdminU> {
  final ApiService api = ApiService();
  AuthBloc vueltaBlocAdmin;
  List<UsuarioList> usuariosList;
  SharedPreferences datos;
  String email;
  String nombre;

  @override
  void initState() {
    vueltaBlocAdmin = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (usuariosList == null) {
      usuariosList = List<UsuarioList>();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      drawer: DrawerAdmin(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccesState) {
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) => User(id: state.id)));
          } else if (state is AdminLoginSuccesState) {
            return Navigator.pushNamed(context, '/adminC');
          } else if (state is ControlPageState) {
            return Navigator.pushNamed(context, '/login');
          }
        },
        child: Container(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return usuariosList.length > 0
                  ? ListaUsarios(usuarios: usuariosList)
                  : Center(
                      child: Text('No existen Datos, A??ade uno'),
                    );
            },
          ),
        ),
      ),
    );
  }

  Future loadList() {
    Future<List<UsuarioList>> futureCase = api.getAllAlumnos();
    futureCase.then((usuariosList) {
      setState(() {
        this.usuariosList = usuariosList;
      });
    });
  }
}
