import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/utils/header.dart';

import '../utils/formfield.dart';

bool? _showText1;
bool? _showText2;

class Register extends ConsumerStatefulWidget {
  const Register({super.key});
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<Register> {

  TextEditingController _passcontroller1 = TextEditingController();
  TextEditingController _passcontroller2 = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

  @override
  void initState(){
    _showText1 = false;
    _showText2 = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeH = size.height * 0.06;
    final formSizeW = size.width;
    String pass = '';

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Form(
              child: Wrap(children: [
            generalForm('First Name', formSizeW, 50,
                icons: Icons.account_circle_outlined),
            generalForm('Last Name', formSizeW, 50,
                icons: Icons.person),
            generalForm('E-mail', formSizeW, 50,
                icons: Icons.email_outlined, controller: _emailcontroller),
            generalForm('Phone Number', formSizeW, 50,
                icons: Icons.phone, controller: _phonecontroller),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(formSizeW, 50)),
                    child: TextFormField(
                      controller: _passcontroller1,
                      style: const TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          labelText: 'Create Password',
                          labelStyle: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.normal),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          icon: const Icon(
                            Icons.lock_outline,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showText1!
                                  ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                _showText1 = !_showText1!;
                              });
                            },
                          )),
                      obscureText: !_showText1!,
                      maxLines: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? content) {
                        if (content!.isEmpty) {
                          return "Password field can not be empty";
                        } else if (content.length < 8) {
                          return "Password must not be less than eight characters";
                        }
                        return null;
                      },
                      onChanged: (content) {
                      },
                    ))),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints.tight( Size(formSizeW, 50)),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Colors.indigo, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.normal),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          icon: const Icon(
                            Icons.lock_outline,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showText2!
                                  ?
                                   Icons.visibility_outlined :Icons.visibility_off_outlined,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                _showText2 = !_showText2!;
                              });
                            },
                          )),
                      obscureText: !_showText2!,
                      maxLines: 1,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? content) {
                        if (content!.isEmpty) {
                          return "Password field can not be empty";
                        } else if (content.length < 8) {
                          return "Password must not be less than eight characters";
                        } else if (content != _passcontroller1.text) {
                          return 'Password don\'t match';
                        }
                        return null;
                      },
                    )))
          ])),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context,
                    '/verify', arguments: FormDetail(_emailcontroller, _phonecontroller)), //Don't forget form validation - formkey.currentState.validate()
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ]))));
  }
}
class FormDetail{
  TextEditingController email;
  TextEditingController phone;
  FormDetail(this.email, this.phone);
}