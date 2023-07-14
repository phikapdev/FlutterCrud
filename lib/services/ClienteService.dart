import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_crud/models/Cliente.dart';
import 'package:flutter_crud/utils/ApiConfig.dart';

class ClienteService extends ChangeNotifier {
  
  List<Cliente> clientes = [];
  late Cliente selectedProduct;

  bool isLoading = false;
  bool isSaving = false;

  Map<String,String> headers = { HttpHeaders.contentTypeHeader : 'application/json' };

  ClienteService() {
    getClientes();
  }

  Future<List<Cliente>> getClientes() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.http(ApiConfig.baseUrl , ApiConfig.endPoint);
    final resp = await http.get(url, headers: headers);
    List<dynamic> respJson = jsonDecode(resp.body);
    clientes = respJson.map((item) => Cliente.fromMap(item)).toList();
    
    isLoading = false;
    notifyListeners();

    return clientes;
  }

  Future<Cliente> getCliente(int id) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.http(ApiConfig.baseUrl , '${ApiConfig.endPoint}/$id');
    final resp = await http.get(url, headers: headers);
    Cliente cliente = jsonDecode(resp.body);

    isLoading = false;
    notifyListeners();

    return cliente;
  }

  Future<void> createCliente(Cliente cliente) async {
    final url = Uri.http(ApiConfig.baseUrl, ApiConfig.endPoint);
    final resp = await http.post(url, body: cliente.toJson(), headers: headers);
    final respJson = jsonDecode(resp.body);
    cliente.id = respJson['id'];
    print(respJson);
  }

  Future<void> updateCliente(Cliente cliente) async {
    final url = Uri.http(ApiConfig.baseUrl, '${ApiConfig.endPoint}/${cliente.id}');
    final resp = await http.put(url, body: cliente.toJson(), headers: headers);
    final respJson = jsonDecode(resp.body);
    print(respJson);
    cliente.id = respJson['id'];
  }

  Future<void> deleteCliente(int id)async{
    final url = Uri.http(ApiConfig.baseUrl , '${ApiConfig.endPoint}/$id');
    final resp = await http.delete(url, headers: headers);
    final respJson = jsonDecode(resp.body);
    print(respJson);
  }

  Future saveOrCreateProduct(Cliente cliente) async{

    isSaving = true;
    notifyListeners();

    if(cliente.id == null){
      await createCliente(cliente);
    }else{
      await updateCliente(cliente);
    }

    isSaving = false;
    notifyListeners();

  }
}
