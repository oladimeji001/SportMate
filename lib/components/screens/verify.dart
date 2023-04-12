import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/register.dart';
import 'package:sportmate/components/utils/formfield.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeW = size.width;
    final register = ModalRoute.of(context)?.settings.arguments as FormDetail; //Retrieve information from previous screen

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Verification'),
      ),
      body: Center(
        child: Stepper(type: StepperType.horizontal, steps: [
          Step(
              title: const Text(
                'Email Verification',
                style: TextStyle(fontSize: 14),
              ),
              content: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Verification link will be sent to ${register.email.text}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                      child: Text('Tap proceed button to continue')),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => null,
                        child: const Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ],
              )),
          Step(
            title: const Text(
              'Phone Verification',
              style: TextStyle(fontSize: 14),
            ),
            content: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Tap below to Change Phone Number'),
                ),
                generalForm('Phone', 300, 50, icons: Icons.phone),
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: const Text('Enter OTP here'),
                ),
                Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: const TextField(
                      maxLength: 6,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '_ _ _ _ _ _',
                          hintStyle: TextStyle(fontSize: 30)),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
