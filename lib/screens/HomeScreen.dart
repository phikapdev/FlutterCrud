import 'package:flutter/material.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:flutter_crud/widgets/ClienteCard.dart';
import 'package:flutter_crud/models/Cliente.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<ClienteService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Flutter')),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
          itemCount: clienteService.clientes.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: ClienteCard(
                cliente: clienteService.clientes[index],
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                              leading: Icon(Icons.remove_red_eye),
                              title: Text('Ver'),
                              onTap: () {
                                clienteService.selectedProduct =
                                    clienteService.clientes[index].copy();
                                Navigator.pushNamed(context, 'details');
                              }),
                          ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Editar'),
                              onTap: () {
                                clienteService.selectedProduct =
                                    clienteService.clientes[index].copy();
                                Navigator.pushNamed(context, 'form');
                              }),
                          ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Eliminar'),
                              onTap: () {
                                clienteService.deleteCliente(
                                    clienteService.clientes[index].id!);
                              })
                        ],
                      );
                    });
              })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            clienteService.selectedProduct =
                Cliente(nombre: "", apellido: "", email: "", createAt: "");
            Navigator.pushNamed(context, 'form');
          },
          child: Icon(Icons.add)),
    );
  }
}
