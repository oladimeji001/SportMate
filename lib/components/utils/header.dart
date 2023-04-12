import 'package:flutter/material.dart';

Widget sportMateHeader(var size){
  double value = 20;
  return Container(
      alignment: Alignment.topRight,
      padding:
      EdgeInsets.symmetric(horizontal: value),
      child: RichText(
        text: TextSpan(
            text: 'Sport',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: value,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: 'Mate',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: value,
                      fontWeight: FontWeight.w600))
            ]),
      ));
}