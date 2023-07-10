import 'dart:async';
import 'package:cuartup/Data/home_data_provider.dart';
import 'package:cuartup/Models/comment.dart';

class HomeBloc {
  final HomeDataProvider _dataProvider;

  HomeBloc(this._dataProvider);

  Future<List<Comment>> getComments() async {
    // Lógica para obtener los comentarios desde el proveedor de datos
    return _dataProvider.getComments();
  }

  Future<void> addComment(Comment comment) async {
    // Lógica para agregar un comentario utilizando el proveedor de datos
    await _dataProvider.addComment(comment);
  }

  void dispose() {
    // Lógica para liberar los recursos
  }
}
