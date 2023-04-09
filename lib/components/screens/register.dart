import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: ListView(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(
                  size.width * 0.015,
                ),
                child: IconButton(
                  tooltip: 'back',
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                )),
            Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(horizontal: size.height * 0.024),
                child: RichText(
                  text: const TextSpan(
                      text: 'Sport',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: 'Mate',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w600))
                      ]),
                )),
          ]),
          Form(
            child: Container(child: TextField()),
          )
        ])));
  }
}
