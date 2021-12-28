class RegistrosDTO {
  late String dataHoraRegistro;
  late String dataBatida;
  late String status;
  late String mensagem;
  late String nomeUsuario;
  late int codigoUsuario;
  late double latitude;
  late double longitude;
  late String descricaoDia;

  RegistrosDTO.fromJson(Map<String, dynamic> json) {
    dataHoraRegistro = json['dataHoraRegistro'];
    dataBatida = json['dataBatida'];
    status = json['status'];
    mensagem = json['mensagem'];
    nomeUsuario = json['nomeUsuario'];
    codigoUsuario = json['codigoUsuario'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    descricaoDia = json['descricaoDia'];
  }
}
