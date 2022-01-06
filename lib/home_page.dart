import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workspace_flutter/app_bar_ponto.dart';
import 'package:workspace_flutter/dto/UsuarioDTO.dart';
import 'package:workspace_flutter/registrar_ponto_page.dart';
import 'package:workspace_flutter/registros_ponto_page.dart';
import 'package:workspace_flutter/service/FuncionarioService.dart';
import 'package:workspace_flutter/utils/loader.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UsuarioDTO usuario = UsuarioDTO();
  int _selectedIndex = 0;

  String nomeUsuario = "";

  final FuncionarioService funcionarioService = FuncionarioService();

  static const List<Widget> _widgetOptions = <Widget>[
    RegistrarPonto(),
    Registros()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    funcionarioService.buscarFuncionarioLogado().then(
          (usuarioBuscado) => {
            setState(
              () {
                usuario = usuarioBuscado;
                nomeUsuario = usuarioBuscado.nome;
              },
            ),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPonto(nomeUsuario),
      body: body(context),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            const TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold
                //fontSize: 22,
                ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userClock),
            label: 'Registrar',
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.clock),
            label: 'Registros',
            backgroundColor: Colors.black12,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  body(context) {
    return Container(child: _widgetOptions.elementAt(_selectedIndex));
  }
}
