import 'package:flutter/material.dart';
import 'package:cuartup/BLoC/register_bloc.dart';
import 'package:cuartup/Models/user.dart';
import 'package:cuartup/Data/register_data_provider.dart';
import 'package:cuartup/View/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc _bloc;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = RegisterBloc(RegisterDataProvider());
  }

  @override
  void dispose() {
    _bloc.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final user = User(name: name, email: email, password: password, id: '');
    // Lógica adicional después de realizar el registro, como mostrar una notificación o redirigir a otra pantalla
  }

  void _goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Registrarse'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'ruta_de_la_imagen_del_logo', // Agrega la ruta de la imagen del logo
              width: 100.0, // Ajusta el ancho del logo según tus necesidades
              height: 100.0, // Ajusta el alto del logo según tus necesidades
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nombre',
                filled: true,
                fillColor: Colors.white,
              ),
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
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: _goToLogin,
              child: Text(
                '¿Ya tienes una cuenta?',
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
