import 'package:flutter_crud/models/Cliente.dart';
import 'package:flutter/material.dart';

class ClienteCard extends StatelessWidget {

  final Cliente cliente;

  const ClienteCard({super.key, required this.cliente});
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(cliente.nombre + " " + cliente.apellido),
          subtitle: Text(cliente.email),
          leading: Icon(Icons.person, size: 45),
          trailing: Text(cliente.createAt.toString()));
  }
}

