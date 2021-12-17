import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
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
    } else {
      return Container(
        //color: Colors.red,
        child: GroupedListView<RegistrosDTO, String>(
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
              width: MediaQuery.of(context).size.width * 0.99,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(0),
              child: Text(
                element,
                style: const TextStyle(fontSize: 20, color: Color(0xFF707070)),
              ),
            ),
          ),

          itemBuilder: (c, element) {
            return Column(
              children: [
                Container(
                  //color: Colors.blueGrey[50],
                  //width: MediaQuery.of(context).size.width * 0.99,
                  //padding: EdgeInsets.all(10),
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, right: 20, top: 10),
                  margin: const EdgeInsets.all(0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              element.status,
                              style: const TextStyle(
                                color: Color(0xFF003E51),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              //widget.descricaoPapel,
                              element.dataHoraRegistro,
                              style: const TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: 15,
                                  fontFamily: 'Arial'),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              //widget.descricaoPapel,
                              element.mensagem,
                              style: const TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: 15,
                                  fontFamily: 'Arial'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          /*
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/microsoftTeams.png',
                            height: 28,
                            width: 28,
                          ),
                        ),

                         */
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black87,
                )
              ],
            );
          },
          // useStickyGroupSeparators: true,
        ),
      );
    }
  }
}
