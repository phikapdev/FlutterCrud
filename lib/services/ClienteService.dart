import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/models/Cliente.dart';

class ClienteService extends ChangeNotifier {
  final String _baseUrl = '192.168.0.233:8080';
  
  List<Cliente> clientes = [];
  late Cliente selectedProduct;

  bool isLoading = false;
  bool isSaving = false;

  ClienteService() {
    getClientes();
  }

  Future<List<Cliente>> getClientes() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseUrl, '/api/clientes');
    final resp = await http.get(url);
    List<dynamic> listCliente = jsonDecode(resp.body);

    clientes = listCliente.map((item) => Cliente.fromMap(item)).toList();
  
     isLoading = false;
     notifyListeners();

    return clientes;

  }

  Future<Cliente> getCliente(int id) async {

    isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseUrl, '/api/clientes/${id}');
    final resp = await http.get(url);
    Cliente cliente = jsonDecode(resp.body);

     isLoading = false;
     notifyListeners();

    return cliente;

  }

  Future<void> createCliente(Cliente cliente) async {
    final url = Uri.http(_baseUrl, '/api/clientes');
    final resp = await http.post(url, body: cliente.toMap());
    final decodeData = jsonDecode(resp.body);

    print(decodeData);
    cliente.id = decodeData['id'];
  }

  Future<void> updateCliente(Cliente cliente) async {
    final url = Uri.http(_baseUrl, '/api/clientes/${cliente.id}');
    final resp = await http.put(url, body: cliente.toMap());
    final decodeData = jsonDecode(resp.body);

    print(decodeData);
    cliente.id = decodeData['id'];
  }

  Future<void> deleteCliente(int id)async{
    final url = Uri.http(_baseUrl, '/api/clientes/${id}');
    final resp = await http.delete(url);
    final decodeData = jsonDecode(resp.body);

    print(decodeData);
  }

  Future saveOrCreateProduct(Cliente cliente) async{

    isSaving = true;
    notifyListeners();

    if(cliente.id == null){
      await this.createCliente(cliente);
    }else{
      await this.updateCliente(cliente);
    }

    isSaving = false;
    notifyListeners();

  }
}
