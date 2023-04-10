import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/utils/header.dart';

import '../utils/formfield.dart';

bool showText = false;

class Register extends ConsumerStatefulWidget {
  const Register({super.key});
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<Register> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeH = size.height * 0.06;
    final formSizeW = size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(
                  size.width * 0.015,
                ),
                child: IconButton(
                  tooltip: 'back',
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.blueAccent,
                  ),
                )),
            sportMateHeader(size),
          ]),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Fill in your details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Form(
              child: Wrap(children: [
            generalForm('Full Name', formSizeW, formSizeH, icons: Icons.account_circle_outlined),
            generalForm('E-mail', formSizeW, formSizeH, icons: Icons.email_outlined),
            generalForm('Phone Number', formSizeW, formSizeH, icons: Icons.phone),
            passwordForm('Create Password'),
            passwordForm('Confirm Password'),
          ])),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: size.width * 0.382,
            height: size.height * 0.06,
            child: ElevatedButton(
                onPressed: () => null,
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ])));
  }

  Widget passwordForm(String label) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ConstrainedBox(
            constraints: BoxConstraints.tight(const Size(400, 50)),
            child: TextFormField(
              style: const TextStyle(
                  color: Colors.indigo, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.normal),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.blueAccent,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      showText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        showText = !showText;
                      });
                    },
                  )),
              obscureText: !showText,
              maxLines: 1,
              validator: (String? content) {},
            )));
  }
}
