import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:workspace_flutter/dto/LocalizacaoDTO.dart';
import 'package:workspace_flutter/dto/PontoRegistradoDTO.dart';
import 'package:workspace_flutter/dto/RegistrosDTO.dart';
import 'package:workspace_flutter/service/ServiceUtils.dart';

class PontoService extends ServiceUtils {
  final String apiVersion = "/ponto";

  Future<PontoRegistradoDTO> registrarPonto(
      LocalizacaoDTO localizacaoDTO) async {
    Uri url = Uri.http(apiUrl, '/ponto/registro', {'q': '{http}'});

    final response = http.post(url,
        headers: ServiceUtils.headerJWT, body: localizacaoDTO.toJson());

    PontoRegistradoDTO retorno = PontoRegistradoDTO();
    await response.then((res) {
      var data = json.decode(utf8.decode(res.bodyBytes));
      retorno = PontoRegistradoDTO.fromJson(data);
    }, onError: (exp) {
      print(exp);
    });

    return retorno;
  }

  Future<List<RegistrosDTO>> buscarRegistros() async {
    Uri url = Uri.http(apiUrl, '/ponto/registro/v2', {'q': '{http}'});

    final response = http.get(url, headers: ServiceUtils.headerJWT);

    List<RegistrosDTO> registros = [];

    await response.then((res) {
      List<dynamic> responseList = json.decode(utf8.decode(res.bodyBytes));

      for (int i = 0; i < responseList.length; i++) {
        registros.add(RegistrosDTO.fromJson(responseList.elementAt(i)));
      }
    }, onError: (exp) {
      print(exp);
    });

    return registros;
  }
}
