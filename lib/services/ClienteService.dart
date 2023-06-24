

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/models/Cliente.dart';

class ClienteService extends ChangeNotifier {
  final String _baseUrl = 'localhost:8080';

  final List<Cliente> clientes = [];
  late Cliente selectedProduct;

  bool isLoading = false;
  bool isSaving = false;

  ClienteService() {
    this.loadClientes();
  }

  Future<List<Cliente>> loadClientes() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseUrl, '/api/clientes');
    final resp = await http.get(url);
    final Map<String, dynamic> clienteMap = json.decode(resp.body);
    
    clienteMap.forEach((key, value) {
        final tempCliente = Cliente.fromMap(value);
        this.clientes.add(tempCliente);
    });

     this.isLoading = false;
     notifyListeners();

    return this.clientes;

  }

  Future saveOrCreateProduct(Cliente cliente) async{

    isSaving = true;
    notifyListeners();


    if(cliente.id == null){
      await this.createProduct(cliente);
    }else{
      await this.updateProduct(cliente);
    }

    isSaving = false;
    notifyListeners();

  }

  Future<int> updateProduct(Cliente cliente) async {
    final url = Uri.https(_baseUrl, 'products/${cliente.id}.json');
    final resp = await http.put(url, body: cliente.toMap());
    final decodeData = resp.body;

    final index = this.clientes.indexWhere((element) => element.id == cliente.id);
    this.clientes[index] = cliente;

    return cliente.id;
  }

  Future<int> createProduct(Cliente cliente) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: cliente.toMap());
    final decodeData = json.decode(resp.body);

    cliente.id = decodeData['name'];
    this.clientes.add(cliente);

    print(decodeData);

    return cliente.id;
  }
}
