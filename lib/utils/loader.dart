import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.98,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          //Text('Aguarde'),
          CircularProgressIndicator(
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}
