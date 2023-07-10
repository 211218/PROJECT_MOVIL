import 'package:cuartup/Data/account_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:cuartup/BLoC/account_bloc.dart';
import 'package:cuartup/Repository/account_repository.dart';
import 'package:cuartup/View/widgets/avatar_widget.dart';

class AccountScreen extends StatelessWidget {
  final AccountBloc _accountBloc = AccountBloc(
    AccountRepository(AccountDataProvider()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Cuenta'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarWidget(),
            SizedBox(height: 16.0),
            Text(
              'Nombre de Usuario',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Cambiar nombre'),
              onTap: () {
                // Acción para cambiar el nombre
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Cambiar contraseña'),
              onTap: () {
                // Acción para cambiar la contraseña
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              onTap: () {
                // Acción para cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}