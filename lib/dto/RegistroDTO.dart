import 'dart:convert' as convert;

class RegistroDTO {
  final int codigo;
  final String usuario;

  RegistroDTO({required this.codigo, required this.usuario});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['usuario'] = usuario;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}
