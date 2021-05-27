import 'package:flutter/material.dart';
import 'package:flutter_application_gym/auth_b/auth_bloc.dart';
import 'package:flutter_application_gym/pages/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerUser extends StatefulWidget {
  DrawerUser();

  @override
  _DrawerUserState createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  AuthBloc deslogUser;

  @override
  void initState() {
    deslogUser = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is UserLoginSuccesState) {
              return UserAccountsDrawerHeader(
                accountName: Text(state.nombre),
                accountEmail: Text(state.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: state.img == null || state.img == ""
                      ? Image.asset("assets/images/user.png", fit: BoxFit.cover)
                      : NetworkImage("${state.img}"),
                ),
              );
            } else {
              return ListTile(
                title: Text("Error al cargar los datos"),
                trailing: Icon(Icons.error),
              );
            }
          }),
          ListTile(
            title: Text("Perfil"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            title: Text("Clases gymOn"),
            trailing: Icon(Icons.apps_outlined),
            onTap: () {
              Navigator.pushNamed(context, '/userC');
            },
          ),
          ListTile(
            title: Text("Mis clases"),
            trailing: Icon(Icons.app_registration),
            onTap: () {
              // Navigator.pushNamed(context, '/user');
            },
          ),
          Divider(),
          ListTile(
            title: Text("Log out"),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              deslogUser.add(EliminarToken());
            },
          )
        ],
      ),
    );
  }
}
