import 'package:flutter/material.dart';
import 'package:sportmate/components/utils/formfield.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  UpdateUserName createState() => UpdateUserName();
}

class UpdateUserName extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final formSizeH = size.height * 0.06;
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
      body: Column(
        children: [
          generalForm(
              'Enter New Username', formSizeW, formSizeH, icons: Icons.person),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: size.width * 0.382,
            height: size.height * 0.06,
            child: ElevatedButton(
                onPressed: () => null,
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}