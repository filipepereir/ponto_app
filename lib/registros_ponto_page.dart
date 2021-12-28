import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:workspace_flutter/service/PontoService.dart';
import 'package:workspace_flutter/utils/loader.dart';

import 'dto/RegistrosDTO.dart';

class Registros extends StatefulWidget {
  const Registros({Key? key}) : super(key: key);

  @override
  _RegistrosState createState() => _RegistrosState();
}

class _RegistrosState extends State<Registros> {
  List<RegistrosDTO> registros = [];

  PontoService pontoService = PontoService();

  bool loader = false;

  @override
  void initState() {
    super.initState();
    loader = true;
    pontoService.buscarRegistros().then((value) {
      setState(
        () {
          registros = value;
        },
      );
    }).whenComplete(
      () => {
        loader = false,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loader) {
      return Container(
        alignment: Alignment.center,
        child: Loader(),
      );
    } else if (registros.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: const Text(
          'Nenhum registro encontrado',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return GroupedListView<RegistrosDTO, String>(
        elements: registros,
        groupBy: (element) => element.descricaoDia,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1.descricaoDia.compareTo(item2.descricaoDia),
        order: GroupedListOrder.DESC,
        groupSeparatorBuilder: (String element) => Material(
          elevation: 3,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(0),
            child: Text(
              element,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),

        itemBuilder: (c, element) {
          return Card(
            elevation: 10,
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  //color: Colors.blueGrey[50],
                  width: MediaQuery.of(context).size.width * 0.99,
                  height: 80,
                  //padding: EdgeInsets.all(10),
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 20, top: 20),
                  margin: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*
                          FittedBox(
                            child: Text(
                              element.status,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),

                           */
                          FittedBox(
                            child: Text(
                              //widget.descricaoPapel,
                              element.dataHoraRegistro,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              element.mensagem,
                              style: const TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _localizacao("-15.7879", "-48.1198");
                            },
                            child: const Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color: Colors.blueAccent,
                              size: 20,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        // useStickyGroupSeparators: true,
      );
    }
  }

  _localizacao(lat, long) {
    return showBarModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.97,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Text("Localiz ai bb, ${lat}  ${long}"),
        ),
      ),
    );
  }
}
