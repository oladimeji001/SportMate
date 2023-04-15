import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/authcontroller.dart';
import 'package:sportmate/components/utils/formfield.dart';

class UpdateEmail extends ConsumerStatefulWidget {
  const UpdateEmail();

  @override
  UpdateEmailC createState() => UpdateEmailC();
}

class UpdateEmailC extends ConsumerState {
  TextEditingController emailController = TextEditingController();

  void updateEmail(String newEmail) {
    ref.read(authControllerProvider).updateEmail(context, newEmail);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeH = size.height * 0.06;
    final formSizeW = size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Update Email'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Enter New Email address'),
            ),
            generalForm('E-mail', formSizeW, formSizeH,
                icons: Icons.email_outlined, controller: emailController),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => updateEmail(emailController.text),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        )));
  }
}
