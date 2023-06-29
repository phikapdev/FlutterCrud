import 'package:flutter/material.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:flutter_crud/widgets/ClienteCard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
   const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
  final clienteService = Provider.of<ClienteService>(context);
  
    return Scaffold(
      appBar: AppBar(title: Text('Listado Clientes')),
      body:ListView.builder(
        itemCount: clienteService.clientes.length,
        itemBuilder:(BuildContext context, int index) => GestureDetector(
          child: ClienteCard(
            cliente: clienteService.clientes[index],
          ),
          onTap: () {
            
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'form');
        },
        child: Icon(Icons.add)
      ),
    );
  }
}