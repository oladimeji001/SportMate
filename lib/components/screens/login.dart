import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/authcontroller.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/utils/formfield.dart';
import 'package:sportmate/components/utils/header.dart';

bool _showText = false;
class Login extends ConsumerStatefulWidget{
  const Login({super.key});

  @override
  LoginState createState()=> LoginState();
}
class LoginState extends ConsumerState {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login(String email, String password){
    ref.read(authControllerProvider).emailSignIn(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeW = size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.015,
                      ),
                      child: IconButton(
                        tooltip: 'Back',
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.blueAccent,
                        ),
                      )),
                 sportMateHeader(size),
                ],
              ),
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text: 'Welcome\n',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Enter your Login details',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black))
                          ]))),
              Form(
                  key: formKey,
                  child: Wrap(children: [
                    generalForm('E-mail', formSizeW, 50, icons: Icons.email_outlined, controller: emailController),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(formSizeW, 50)),
                            child: TextFormField(
                              controller: passController,
                              style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.normal),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueAccent)),
                                    errorBorder:
                                    const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueGrey)),
                                    icon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.blueAccent,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _showText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                        color: Colors.blueAccent ,
                                      ),

                                      onPressed: () {
                                        setState(() {
                                          _showText = !_showText;
                                        });
                                      },
                                    )),
                              obscureText: !_showText,
                              maxLines: 1,
                            validator: (String? content){
                                if (content!.isEmpty){
                                  return "Password field can not be empty";
                                }
                                return null;
                            }
                            ),
                        ))

                  ])),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () => Navigator.pushNamed(context, sportRoute.forgot_pass),
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16),
                      ))),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                          login(emailController.text, passController.text);
                      }
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'Register',
                            style: const TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed(sportRoute.register))
                      ])))
            ],
          ),
        )));
  }
}
