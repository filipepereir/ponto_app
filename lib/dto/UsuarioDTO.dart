import 'dart:convert' as convert;

class UsuarioDTO {
  late int codigo;
  late String nome;
  late String email;

  UsuarioDTO();

  UsuarioDTO.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['nome'] = nome;
    data['email'] = email;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}
