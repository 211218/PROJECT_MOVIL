import 'dart:async';
import 'package:cuartup/Data/login_data_provider.dart';
import 'package:cuartup/Models/user.dart';

class LoginBloc {
  final LoginDataProvider _dataProvider;

  LoginBloc(this._dataProvider);

  Future<User> login(String email, String password) async {
    // Lógica para realizar el inicio de sesión utilizando el proveedor de datos
    return _dataProvider.login(email, password);
  }

  void dispose() {
    // Lógica para liberar los recursos
  }
}
