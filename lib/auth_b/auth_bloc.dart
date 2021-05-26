import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_gym/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ApiService service;
  AuthBloc(AuthState initialState, this.service) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    var pref = await SharedPreferences.getInstance();

    if (event is StartEvent) {
      yield LoginInitialState();
    } else if (event is LoginButtonPress) {
      yield AuthInitial();
      var datos = await service.login(event.email, event.password);
      var img;
      if (datos['usuarioLogin']['role'] == 'user') {
        pref.setString('token', datos['token']);
        pref.setString('role', datos['usuarioLogin']['role']);
        pref.setString('id', datos['usuarioLogin']['_id']);
        pref.setString('nombre', datos['usuarioLogin']['nombre']);
        pref.setString('email', datos['usuarioLogin']['email']);
        // pref.setString('altura', datos['usuarioLogin']['altura']);
        // pref.setString('peso', datos['usuarioLogin']['peso']);

        if (datos['usuarioLogin']['img'] == null) {
          pref.setString('img', "assets/imagen/user.png");
          img = "assets/imagen/user.png";
        } else {
          pref.setString('img',
              "http://192.168.1.45:3000/img/${datos['usuarioLogin']['img']}");
          img = "http://192.168.1.45:3000/img/${datos['usuarioLogin']['img']}";
        }
        yield UserLoginSuccesState(
          id: datos['usuarioLogin']['_id'],
          nombre: datos['usuarioLogin']['nombre'],
          email: datos['usuarioLogin']['email'],
          img: img,
        );
      } else if (datos['usuarioLogin']['role'] == 'admin' ||
          datos['usuarioLogin']['role'] == 'profesor') {
        pref.setString('token', datos['token']);
        pref.setString('role', datos['usuarioLogin']['role']);
        pref.setString('id', datos['usuarioLogin']['_id']);
        pref.setString('nombre', datos['usuarioLogin']['nombre']);
        pref.setString('email', datos['usuarioLogin']['email']);
        if (datos['usuarioLogin']['img'] == null) {
          pref.setString('img', "assets/imagen/user.png");
          img = "assets/imagen/user.png";
        } else {
          pref.setString('img',
              "http://192.168.1.45:3000/img/${datos['usuarioLogin']['img']}");
          img = "http://192.168.1.45:3000/img/${datos['usuarioLogin']['img']}";
        }
        yield AdminLoginSuccesState(
          id: datos['usuarioLogin']['_id'],
          nombre: datos['usuarioLogin']['nombre'],
          email: datos['usuarioLogin']['email'],
          img: img,
        );
      } else {
        yield LoginErrorState(message: datos['msg'][0]);
      }
    } else if (event is ComprobarPaginas) {
      if (pref.getString('token') == null) {
        yield LoginInitialState();
      } else {
        if (pref.getString('role') == 'user') {
          yield UserLoginSuccesState(
            id: pref.getString('id'),
            nombre: pref.getString('nombre'),
            email: pref.getString('email'),
            img: pref.getString('img'),
          );
        } else if (pref.getString('role') == 'admin' ||
            pref.getString('role') == 'profesor') {
          yield AdminLoginSuccesState(
            id: pref.getString('id'),
            nombre: pref.getString('nombre'),
            email: pref.getString('email'),
            img: pref.getString('img'),
          );
        }
      }
    } else if (event is EliminarToken) {
      pref.clear();
      yield ControlPageState();
    }
  }
}
