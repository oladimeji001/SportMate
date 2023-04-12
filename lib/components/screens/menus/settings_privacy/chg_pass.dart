import 'package:flutter/material.dart';

bool _showText = false;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          passwordForm('Create new password'),
          passwordForm('Confirm password'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () => null,
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    ));
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
                      _showText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _showText = !_showText;
                      });
                    },
                  )),
              obscureText: !_showText,
              maxLines: 1,
              validator: (String? content) {},
            )));
  }
}
