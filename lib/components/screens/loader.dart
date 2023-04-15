import 'package:flutter/material.dart';

class SportLoader extends StatefulWidget {
  const SportLoader();

  @override
  State createState() => SportLoaderState();
}

class SportLoaderState extends State {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
