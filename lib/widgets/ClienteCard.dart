import 'package:flutter_crud/models/Cliente.dart';
import 'package:flutter/material.dart';

class ClienteCard extends StatelessWidget {

  final Cliente cliente;

  const ClienteCard({super.key, required this.cliente});
 
  @override
  Widget build(BuildContext context) {
    return Card(child:ListTile(
          title: Text(cliente.nombre),
          subtitle: Text(cliente.email),
          leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
          trailing: Icon(Icons.star)));
  }
}

