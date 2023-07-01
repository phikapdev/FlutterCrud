import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_crud/providers/ClienteFormProvider.dart';
import 'package:flutter_crud/services/ClienteService.dart';
import 'package:flutter_crud/widgets/InputDecorations.dart';

class FormularioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clienteService = Provider.of<ClienteService>(context);

    return ChangeNotifierProvider(
      create: (_) => ClienteFormProvider(clienteService.selectedProduct),
      child: _ClienteScreenBody(clienteService: clienteService),
    );
  }
}

class _ClienteScreenBody extends StatelessWidget {
  const _ClienteScreenBody({
    Key? key,
    required this.clienteService,
  }) : super(key: key);

  final ClienteService clienteService;

  @override
  Widget build(BuildContext context) {
    final clienteForm = Provider.of<ClienteFormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Formulario Clientes')),
      body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            SizedBox(
              height: 100,
            ),
            _ClienteForm(),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text('Guardar', style: TextStyle(color: Colors.white)),
                ),
                onPressed: clienteService.isSaving
                    ? null
                    : () async {
                        if (!clienteForm.isValidForm()) return;
                        await clienteService
                            .saveOrCreateProduct(clienteForm.cliente);
                      })
          ])),
    );
  }
}

class _ClienteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clienteForm = Provider.of<ClienteFormProvider>(context);
    final cliente = clienteForm.cliente;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: clienteForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: cliente.nombre,
                onChanged: (value) => cliente.nombre = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El Nombre es Obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoratios(
                    hintText: "Nombre", labelText: "Nombre"),
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: cliente.apellido,
                onChanged: (value) => cliente.apellido = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El Nombre es Obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoratios(
                    hintText: "Apellido", labelText: "Apellido"),
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: cliente.email,
                onChanged: (value) => cliente.email = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'El Email es Obligatorio';
                  }
                  return null;
                },
                decoration: InputDecorations.authInputDecoratios(
                    hintText: "Email", labelText: "Email"),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
