import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:workspace_flutter/login.dart';
import 'package:workspace_flutter/service/ServiceUtils.dart';

class AppBarPonto extends StatefulWidget with PreferredSizeWidget {
  final String nomeUsuarioLogado;

  const AppBarPonto(this.nomeUsuarioLogado);

  @override
  _AppBarPontoState createState() => _AppBarPontoState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarPontoState extends State<AppBarPonto> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              sair();
            },
            child: const Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.blue,
              size: 20,
            ),
          ),
        )
      ],
      title: Center(
        child: Text(
          'Olá, ${widget.nomeUsuarioLogado}',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
    );
  }

  sair() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          if (const Login().toString().contains('TelaLogin')) {
            ServiceUtils.invalidateToken();
          }
          return const Login();
        },
      ),
    );
  }
}
