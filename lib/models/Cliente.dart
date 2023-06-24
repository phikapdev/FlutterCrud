import 'dart:convert';

class Cliente {
    int id;
    String nombre;
    String apellido;
    String email;
    DateTime createAt;

    Cliente({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.email,
        required this.createAt,
    });

    factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        createAt: DateTime.parse(json["createAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "createAt": "${createAt.year.toString().padLeft(4, '0')}-${createAt.month.toString().padLeft(2, '0')}-${createAt.day.toString().padLeft(2, '0')}",
    };

    Cliente copy() => Cliente(
      id: this.id, 
      nombre: this.nombre, 
      apellido: this.apellido,
      email:  this.email,
      createAt: this.createAt);
}
