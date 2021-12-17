import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:intl/intl.dart';
import 'package:workspace_flutter/dto/LocalizacaoDTO.dart';
import 'package:workspace_flutter/dto/PontoRegistradoDTO.dart';
import 'package:workspace_flutter/service/PontoService.dart';
import 'package:workspace_flutter/utils/loader.dart';

class RegistrarPonto extends StatefulWidget {
  const RegistrarPonto({Key? key}) : super(key: key);

  @override
  _RegistrarPontoState createState() => _RegistrarPontoState();
}

class _RegistrarPontoState extends State<RegistrarPonto> {
  double lat = 0.0;
  double long = 0.0;
  String mensagem = "";

  String dataHoje = "";
  String diaHoje = "";

  bool loader = false;

  final diasDaSemana = [
    "Segunda-Feira",
    "Terça-Feira",
    "Quarta-Feira",
    "Quinta-Feira",
    "Sexta-Feira",
    "Sábado",
    "Domingo"
  ];

  @override
  void initState() {
    super.initState();
    final f = new DateFormat('dd/MM/yyyy');

    dataHoje = f.format(DateTime.now()).toString();
    diaHoje = DateTime.now().weekday.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (loader) {
      return Loader();
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DigitalClock(
              secondDigitTextStyle: const TextStyle(
                  fontFamily: 'Arial', fontSize: 35, color: Colors.blue),
              digitAnimationStyle: Curves.decelerate,
              is24HourTimeFormat: true,
              areaDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              hourMinuteDigitTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
              amPmDigitTextStyle: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dataHoje,
              style: const TextStyle(
                color: Colors.black45,
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            ),
            Text(
              diasDaSemana[DateTime.now().weekday - 1],
              style: const TextStyle(
                color: Colors.black45,
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 45,
                width: 140,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Colors.blue, Colors.blueGrey],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                      getLocalizacao();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Registrar",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Arial"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 5),
                          child: const Icon(
                            FontAwesomeIcons.clock,
                            color: Colors.white,
                            size: 18,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  loaderFalse() {
    setState(
      () {
        loader = false;
      },
    );
  }

  loaderTrue() {
    setState(
      () {
        loader = true;
      },
    );
  }

  getLocalizacao() async {
    try {
      loaderTrue();
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;

      LocalizacaoDTO localizacaoDTO = LocalizacaoDTO();
      localizacaoDTO.longitude = long;
      localizacaoDTO.latitude = lat;

      registrarPonto(localizacaoDTO);
    } catch (e) {
      loaderFalse();
      dialog(e.toString(), "ERRO");
      mensagem = e.toString();
    }
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error("Por favor habilite sua localização.");
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error("Por favor autorize o acesso a sua localização.");
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error("Por favor autorize o acesso a sua localização.");
    }

    return await Geolocator.getCurrentPosition();
  }

  registrarPonto(localizacao) async {
    var registro = PontoRegistradoDTO();
    PontoService service = PontoService();
    service
        .registrarPonto(localizacao)
        .then(
          (value) => {
            registro = value,
          },
        )
        .whenComplete(
          () => {
            loaderFalse(),
            dialog(registro.mensagem, registro.status),
          },
        );
  }

  dialog(String mensagem, String status) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(status),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(mensagem),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
