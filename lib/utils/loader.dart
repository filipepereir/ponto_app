import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //Text('Aguarde'),
          CircularProgressIndicator(
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF003E51)),
          ),
        ],
      ),
    );
  }
}
