class UsuarioLogadoDTO {
  late String email;
  late String token;

  UsuarioLogadoDTO();

  UsuarioLogadoDTO.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['token'] = token;

    return data;
  }
}
