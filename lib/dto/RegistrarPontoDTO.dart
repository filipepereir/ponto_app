import 'dart:convert' as convert;

class RegistrarPontoDTO {
  final int codigo;
  final String usuario;

  RegistrarPontoDTO({required this.codigo, required this.usuario});

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
