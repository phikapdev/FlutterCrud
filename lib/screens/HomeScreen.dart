import 'package:flutter/material.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:flutter_crud/widgets/ClienteCard.dart';
import 'package:flutter_crud/models/Cliente.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
   const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
  final clienteService = Provider.of<ClienteService>(context);
  
    return Scaffold(
      appBar: AppBar(title: Text('Flutter')),
      body:ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: clienteService.clientes.length,
        itemBuilder:(BuildContext context, int index) => GestureDetector(
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
                            leading: Icon(Icons.grid_view),
                            title: Text('Ver'),
                            onTap: () {
                              clienteService.selectedProduct = clienteService.clientes[index].copy();
                              Navigator.pushNamed(context, 'form');
                            }
                          ),
                          ListTile(
                            leading: Icon(Icons.update),
                            title: Text('Actualizar'),
                            onTap: () {
                              clienteService.selectedProduct = clienteService.clientes[index].copy();
                              Navigator.pushNamed(context, 'form');
                            }
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Borrar'),
                             onTap: () {
                              clienteService.deleteCliente(clienteService.clientes[index].id!);
                            }
                          )
                        ],
                    );
            });
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clienteService.selectedProduct = Cliente(nombre: "", apellido: "", email: "", createAt: "");
          Navigator.pushNamed(context, 'form');
        },
        child: Icon(Icons.add)
      ),
    );
  }
}