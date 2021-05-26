import 'package:flutter/material.dart';
import 'package:flutter_application_gym/api/api_service.dart';
import 'package:flutter_application_gym/auth_b/auth_bloc.dart';
import 'package:flutter_application_gym/models/clase.dart';
import 'package:flutter_application_gym/pages/user.dart';
import 'package:flutter_application_gym/resources/drawer_admin.dart';
import 'package:flutter_application_gym/resources/lista_clases_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final ApiService api = ApiService();
  AuthBloc vueltaBlocAdmin;
  List<Clase> clasesList;

  @override
  void initState() {
    vueltaBlocAdmin = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (clasesList == null) {
      clasesList = List<Clase>();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lista de Clases'),
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
              return clasesList.length > 0
                  ? ListaClasesAdmin(clases: clasesList)
                  : Center(
                      child: Text('No existen Datos, Añade uno'),
                    );
            },
          ),
        ),
      ),
    );
  }

  Future loadList() {
    Future<List<Clase>> futureCase = api.getAllClases();
    futureCase.then((clasesList) {
      setState(() {
        this.clasesList = clasesList;
      });
    });
  }
}
