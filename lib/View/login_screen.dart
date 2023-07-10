import 'package:flutter/material.dart';
import 'package:cuartup/BLoC/login_bloc.dart';
import 'package:cuartup/Data/login_data_provider.dart';
import 'package:cuartup/View/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _bloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = LoginBloc(LoginDataProvider());
  }

  @override
  void dispose() {
    _bloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final user = await _bloc.login(email, password);
    // Realizar acciones adicionales después de iniciar sesión (por ejemplo, navegar a una pantalla de inicio)
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Iniciar sesión'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Correo',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: _goToRegister,
              child: Text(
                '¿No tienes una cuenta?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
