import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/login.dart';

bool showText = false;

Widget otpForm() {
  return const SizedBox(
      child: TextField(
    decoration: InputDecoration(
        hintText: '_ _ _ _ _ _', hintStyle: TextStyle(fontSize: 30)),
  ));
}

Widget generalForm(
  String label,
  double formSizeW,
  double formSizeH, {
  IconData? icons,
  Widget? prefixIcon,
  int? maxLength,
  double? cursorHeight,
  TextEditingController? controller,
}) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(formSizeW, formSizeH)),
          child: TextFormField(
              controller: controller,
              textCapitalization: label.contains('Name')
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              keyboardType: label.contains('Number') ? TextInputType.phone : TextInputType.text,
              style: const TextStyle(
                  color: Colors.indigo, fontWeight: FontWeight.w600),
              decoration: generalFormDecoration(label,
                  icons: icons, prefixIcon: prefixIcon),
              maxLines: 1,
              maxLength: maxLength,
              cursorHeight: cursorHeight,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? content) {
                if (content!.isEmpty) {
                  return '$label field can not be empty';
                } else if (label == 'E-mail') {
                  if ((!content.endsWith('.com'))) {
                    // || (!content.endsWith('@yahoo.com')) || (!content.endsWith('@gmail.com'))){
                    return 'Please enter a valid email address';
                  }
                }
                return null;
              })));
}

InputDecoration generalFormDecoration(String labelText,
    {IconData? icons, Widget? prefixIcon}) {
  return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
          color: Colors.blueAccent, fontWeight: FontWeight.normal),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      icon: Icon(
        icons,
        color: Colors.blueAccent,
      ),
      prefixIcon: prefixIcon,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey)));
}

InputDecoration passwordFormfield(BuildContext context, bool isTap, set,
    {TextEditingController? controller}) {
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
