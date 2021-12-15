import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:workspace_flutter/dto/RegistroPontoDTO.dart';
import 'package:workspace_flutter/service/ServiceUtils.dart';

class RegistroPontoService extends ServiceUtils {
  final String apiUrl = "localhost:8080";
  final String apiVersion = "/ponto";

  Future<RegistroPontoDTO> registrarPonto() async {
    Uri url =
        Uri.http('192.168.15.13:8080', '/ponto/registro', {'q': '{http}'});

    final response = http.post(url, headers: ServiceUtils.headerJWT);

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
