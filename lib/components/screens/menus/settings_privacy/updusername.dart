import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/utils/formfield.dart';

import '../../../controller/authcontroller.dart';

class UpdateUser extends ConsumerStatefulWidget {
  const UpdateUser({super.key});

  @override
  UpdateUserName createState() => UpdateUserName();
}

class UpdateUserName extends ConsumerState {
  TextEditingController userController = TextEditingController();
  void updateUser(String newUsername){
    ref.read(authControllerProvider).updateUsername(context, newUsername);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeW = size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Update UserName'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              generalForm('Enter New Username', formSizeW, 50,
                  icons: Icons.person, controller:userController),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      updateUser(userController.text.trim());
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ));
  }
}
