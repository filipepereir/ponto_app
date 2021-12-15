import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppBarPonto extends StatefulWidget with PreferredSizeWidget {
  final String text;

  const AppBarPonto(this.text);

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
          child: const Icon(
            FontAwesomeIcons.powerOff,
            color: Colors.blue,
            size: 20,
          ),
        )
      ],
      title: Center(
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.black, fontFamily: 'Arial'),
        ),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
    );
  }
}
