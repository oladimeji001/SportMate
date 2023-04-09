import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/login.dart';


InputDecoration generalFormfield(String labelText) {
  return InputDecoration(

      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blueAccent),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent)),
      errorBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)));
}

InputDecoration passwordFormfield(bool isTap) {
  return InputDecoration(
      labelText: 'Password',
      labelStyle: const TextStyle(color: Colors.blueAccent),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent)),
      errorBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      prefixIcon: const Icon(
        Icons.lock_outline,
        color: Colors.blueAccent,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          Icons.remove_red_eye_outlined,
          color: isTap ? Colors.red : Colors.blueAccent,
        ),
        onPressed: () {
          showText = !showText;
        },
      ));
}
