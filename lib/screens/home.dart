import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showComments = false;
  List<String> comments = [];

  void toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  void addComment(String comment) {
    setState(() {
      comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuarto UP'),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Nombre del usuario'),
              accountEmail: Text('correo@ejemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi cuenta'),
              onTap: () {
                Navigator.pushNamed(context, '/account'); // Navega a la pantalla de cuenta
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Publicaciones'),
              onTap: () {
                Navigator.pushNamed(context, '/home'); // Navega a la pantalla de publicaciones
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () {
                // Lógica para cerrar sesión
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar_publicador.png'),
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre del usuario',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Fecha de publicación',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Publicación',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'Images/cuarto.jpg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Descripción de la imagen',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsumam sidisse commodo sem vel porta tincidunt. Vestibulum venenatis nibh a risus scelerisque, et condimentum purus mattis. Morbi efficitur sagittis purus id condimentum. Pellentesque luctus, enim vel luctus efficitur, nulla neque ultricies odio, ac rhoncus mauris sem sed risus. Sed pulvinar ligula dui, in euismod mauris egestas sit amet.',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 8.0),
                  Text('4.5 estrellas'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: toggleComments,
              child: Text(
                showComments ? 'Ocultar comentarios' : 'Ver comentarios',
              ),
            ),
            if (showComments)
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: comments.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8.0),
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(''),
                    ),
                    title: Text('Usuario'),
                    subtitle: Text(comments[index]),
                  ),
                ),
              ),
            if (showComments)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Agregar comentario',
                  ),
                  onFieldSubmitted: (comment) {
                    addComment(comment);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
