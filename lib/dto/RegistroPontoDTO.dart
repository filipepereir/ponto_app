class RegistroPontoDTO {
  late String dataHoraRegistro;
  late String dataBatida;
  late String status;
  late String mensagem;

  RegistroPontoDTO();

  RegistroPontoDTO.fromJson(Map<String, dynamic> json) {
    dataHoraRegistro = json['dataHoraRegistro'];
    dataBatida = json['dataBatida'];
    status = json['status'];
    mensagem = json['mensagem'];
  }
}
