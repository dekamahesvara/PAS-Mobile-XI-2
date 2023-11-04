import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Text(
          "Ini Homepage",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
