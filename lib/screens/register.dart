import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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
              decoration: InputDecoration(
                hintText: 'Nombre',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para el botón de registro
              },
              child: Text('Registrar'),
            ),
            SizedBox(height: 16.0),
            Text(
              '¿Ya tienes una cuenta?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
