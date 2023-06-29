import 'dart:convert';

class Cliente {
    int id;
    String nombre;
    String apellido;
    String email;
    String createAt;

    Cliente({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.email,
        required this.createAt,
    });

    factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        createAt: json["createAt"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "createAt": createAt,
    };

    Cliente copy() => Cliente(
      id: this.id, 
      nombre: this.nombre, 
      apellido: this.apellido,
      email:  this.email,
      createAt: this.createAt);
}
