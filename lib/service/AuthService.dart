import 'dart:convert';

import 'package:workspace_flutter/dto/UsuarioLogadoDTO.dart';
import 'package:workspace_flutter/dto/UsuarioLoginDTO.dart';

import "package:http/http.dart" as http;

import 'ServiceUtils.dart';

class AuthService extends ServiceUtils {
  static Map<String, String> header = {'Content-Type': 'application/json'};

  Future<UsuarioLogadoDTO> login(UsuarioLoginDTO login) async {
    Uri url = Uri.http('192.168.15.13:8080', '/ponto/auth', {'q': '{http}'});

    final response = http.post(url, headers: header, body: login.toJson());

    UsuarioLogadoDTO retorno = UsuarioLogadoDTO();

    await response.then((res) {
      var data = json.decode(utf8.decode(res.bodyBytes));
      retorno = UsuarioLogadoDTO.fromJson(data);
      saveToken(retorno.token);
    }, onError: (exp) {
      print(exp);
    });

    return retorno;
  }
}
