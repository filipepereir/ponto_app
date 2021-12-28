import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:workspace_flutter/dto/UsuarioDTO.dart';

import 'ServiceUtils.dart';

class FuncionarioService extends ServiceUtils {
  Future<UsuarioDTO> buscarFuncionarioLogado() {
    Uri url = Uri.http('192.168.15.2:8080', '/ponto/funcionario', {'q': '{http}'});

    final response = http.get(url, headers: ServiceUtils.headerJWT);

    return response.then((res) {
      if (res.statusCode >= 300) throw (res.body);
      return res;
    }).then((res) {
      return json.decode(utf8.decode(res.bodyBytes));
    }).then((json) {
      final dto = UsuarioDTO.fromJson(json);
      return dto;
    }, onError: (exp) {});
  }
}
