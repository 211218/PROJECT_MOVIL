import 'package:cuartup/Data/register_data_provider.dart';
import 'package:cuartup/models/user.dart';

class RegisterBloc {
  final RegisterDataProvider _dataProvider;

  RegisterBloc(this._dataProvider);

  Future<void> register(User user) async {
    // Lógica para registrar un nuevo usuario utilizando el proveedor de datos
    await _dataProvider.register(user);
  }

  void dispose() {
    // Lógica para liberar los recursos
  }

}

