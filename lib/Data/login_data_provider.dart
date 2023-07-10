import 'package:cuartup/Models/user.dart';

class LoginDataProvider {
  Future<User> login(String email, String password) async {
    // Lógica para realizar el inicio de sesión con los datos proporcionados
    // Puedes utilizar una API o una base de datos para realizar la autenticación
    // Por simplicidad, este ejemplo no realiza ninguna operación y devuelve un usuario falso
    return User(id: '1', name: 'Nombre de Usuario', email: email, password: '');
  }
}
