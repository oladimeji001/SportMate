import 'package:flutter/material.dart';

bool _showText1 = false;
bool _showText2 = false;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State {
  TextEditingController passcontroller1 = TextEditingController();
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
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(formSizeW, 50)),
                  child: TextFormField(
                    controller: passcontroller1,
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
                            _showText1
                                ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              _showText1 = !_showText1;
                            });
                          },
                        )),
                    obscureText: !_showText1,
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
                            _showText2
                                ?
                            Icons.visibility_outlined :Icons.visibility_off_outlined,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              _showText2 = !_showText2;
                            });
                          },
                        )),
                    obscureText: !_showText2,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? content) {
                      if (content!.isEmpty) {
                        return "Password field can not be empty";
                      } else if (content.length < 8) {
                        return "Password must not be less than eight characters";
                      } else if (content != passcontroller1.text) {
                        return 'Password don\'t match';
                      }
                      return null;
                    },
                  ))),
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
}
