import 'package:flutter/material.dart';
import 'package:workspace_flutter/home_page.dart';
import 'package:workspace_flutter/login.dart';
import 'package:workspace_flutter/registrar_ponto_page.dart';
import 'package:workspace_flutter/registros_ponto_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/home': (_) => HomePage(),
        '/registrar': (_) => const RegistrarPonto(),
        '/registros': (_) => const Registros(),
      },
    ),
  );
}
