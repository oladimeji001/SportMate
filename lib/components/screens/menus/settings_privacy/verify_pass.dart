import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/menus/settings_privacy.dart';

bool showText = false;

class VerifyP extends StatefulWidget {
  const VerifyP({super.key});

  @override
  VerifyPass createState() => VerifyPass();
}

class VerifyPass extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final settingD = ModalRoute.of(context)?.settings.arguments as SettingItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Verify Password'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Enter your password to continue', style: TextStyle(fontSize: 16),),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(400, 50)),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        labelText: 'Password',
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? content) {
                      if (content!.isEmpty) {
                        return "Password field can not be empty";
                      }
                      return null;
                    },
                    onChanged: (content) {
                    },
                  ))),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(settingD.direction);
                },
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
