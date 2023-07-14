
import 'package:flutter_crud/models/Cliente.dart';
import 'package:flutter/material.dart';

class ClienteFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  late Cliente cliente;

  ClienteFormProvider(this.cliente);

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }


}