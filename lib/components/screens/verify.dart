import 'package:flutter/material.dart';
import 'package:sportmate/components/utils/formfield.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeH = size.height * 0.06;
    final formSizeW = size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Verify'),
        ),
        body: Center(
          child: ListView(
            children: [
              generalForm('Phone', formSizeW, formSizeH, icons: Icons.phone),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Enter OTP here'),
              ),
              generalForm('_ _ _ _ ', 200, 50),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/interests'),
                  child: const Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ],
          ),
        ));
  }
}
