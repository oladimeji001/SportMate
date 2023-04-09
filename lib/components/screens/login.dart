import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/utils/formfield.dart';

bool showText = false;
final formProvider = Provider((ref) => showText);
class Login extends ConsumerStatefulWidget{

  const Login({super.key});

  @override
  LoginState createState()=> LoginState();
}
class LoginState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    var formS = ref.watch(formProvider);

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
                        tooltip: 'back',
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.blueAccent,
                        ),
                      )),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.height * 0.024),
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
                      ))
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
                  //key: formKey,
                  child: Wrap(children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(400, 50)),
                            child:  TextField(
                                decoration: generalFormfield('E-mail')
                            ))),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(400, 50)),
                            child: TextField(
                                decoration: InputDecoration(
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
                                        color: showText ? Colors.red : Colors.blueAccent,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showText = !showText;
                                        });
                                      },
                                    ))
                            )))

                  ])),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16),
                      ))),
              SizedBox(
                width: size.width * 0.382,
                height: size.height * 0.06,
                child: ElevatedButton(
                    onPressed: () {},
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
