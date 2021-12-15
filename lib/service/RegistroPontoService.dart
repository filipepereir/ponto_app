import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:workspace_flutter/dto/registro_dto.dart';
import 'package:workspace_flutter/dto/registro_ponto_dto.dart';

class RegistroPontoService {
  static Map<String, String> header = {'Content-Type': 'application/json'};
  final String apiUrl = "localhost:8080";
  final String apiVersion = "/ponto";

  Future<RegistroPontoDTO> registrarPonto() async {
    //Uri url = (buildUrl("registro"));

    Uri url = Uri.http('192.168.15.13:8080', '/ponto/registro', {'q': '{http}'});
    RegistroDTO registro = RegistroDTO(codigo: 1, usuario: "Filipe Pereira");

    String jsonDTO = registro.toJson();

    print(jsonDTO);

    final response = http.post(url, headers: header, body: jsonDTO);
    RegistroPontoDTO retorno = RegistroPontoDTO();
    await response.then((res) {
      var data = json.decode(utf8.decode(res.bodyBytes));
      retorno = RegistroPontoDTO.fromJson(data);
    }, onError: (exp) {
      print(exp);
    });

    return retorno;
  }

  Uri buildUrl(String path) {
    Uri url = Uri.http(this.apiUrl, '$apiVersion/$path');
    return url;
  }
}
