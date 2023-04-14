import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/authcontroller.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/utils/formfield.dart';

class Pass extends ConsumerStatefulWidget {
  const Pass({super.key});
  @override
  PassReset createState() => PassReset();
}

class PassReset extends ConsumerState {
  @override

  TextEditingController emailController = TextEditingController();

  void forgetPass(String email){
      ref.read(authControllerProvider).forgetPass(context, email);
  }

  Widget build(BuildContext context) {
    final formSizeW = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('Forget Password'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
           const Padding(padding: EdgeInsets.all(10.0),child:Text(
              'Enter email address to receive verification link to reset password',
              style: TextStyle(fontSize: 15),
            )),
            generalForm('E-mail', formSizeW, 50, icons: Icons.email_outlined, controller: emailController),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 150,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    forgetPass(emailController.text.trim());
                  },
                  child: const Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ]),
        ));
  }
}
