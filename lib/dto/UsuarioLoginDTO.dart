import 'dart:convert' as convert;

class UsuarioLoginDTO {
  late String email;
  late String senha;

  UsuarioLoginDTO();

  UsuarioLoginDTO.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['senha'] = senha;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}
