import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body(context),
    );
  }

  body(context) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
      child: ListView(
        children: [
          const Icon(
            FontAwesomeIcons.userAlt,
            color: Colors.blue,
            size: 100,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(15),
              //width: 400,
              //height: 300,
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
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
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Entrar",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Arial"),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: const Icon(
                                FontAwesomeIcons.signInAlt,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  login(context) {
    return Navigator.pushNamedAndRemoveUntil(
        context, "/home", (route) => false);
  }
}
