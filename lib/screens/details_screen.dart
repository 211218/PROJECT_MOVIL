import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String item;

  DetailsPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Center(
        child: Text(item),
      ),
    );
  }
}
