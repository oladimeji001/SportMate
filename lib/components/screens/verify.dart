import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/screens/register.dart';
import 'package:sportmate/components/utils/formfield.dart';

import '../controller/authcontroller.dart';

int _stepperCount = 0;
bool _isTap = false;

class Verify extends ConsumerStatefulWidget {
  const Verify({super.key});

  @override
  VerifyS createState() => VerifyS();
}

class VerifyS extends ConsumerState {
  @override
  void initState() {
    _stepperCount = 0;
    _isTap = false;
    super.initState();
  }
  
  void verifyEmail(String email){
    ref.read(authControllerProvider).emailVerification(context, email);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeW = size.width;
    final register = ModalRoute.of(context)?.settings.arguments
        as FormDetail; //Retrieve information from previous screen
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Verification'),
      ),
      body: Center(
        child: Stepper(
            currentStep: _stepperCount,
            onStepContinue: () {
              if (_stepperCount < 1) {
                setState(() {
                  _stepperCount += 1;
                });
              } else if (_stepperCount == 1) {
                Navigator.of(context)
                    .pushReplacementNamed(sportRoute.interests);
              }
            },
            onStepCancel: () {
              if (_stepperCount == 0) {
                Navigator.pop(context);
              }
              setState(() {
                _stepperCount = 0;
              });
            },
            type: StepperType.horizontal,
            steps: [
              Step(
                  state: _stepperCount == 0
                      ? StepState.editing
                      : StepState.complete,
                  isActive: _stepperCount == 0,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          child: Text('Tap proceed button to continue')),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              verifyEmail(register.email.text.trim());
                            },
                            child: const Text(
                              'Proceed',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ],
                  )),
              Step(
                state:
                    _stepperCount > 0 ? StepState.editing : StepState.disabled,
                isActive: _stepperCount > 0,
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
                      child: const Text('OTP will be sent to the number below, tap check button to continue'),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 40), child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(260, 50)),
                      child: ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text('+${register.countrycode} ${register.phone.text}'),
                        trailing: IconButton(
                          icon:  Icon(Icons.check, color: _isTap ? Colors.blueAccent: Colors.black,),
                          onPressed: () {
                            setState(() {
                              _isTap = true;
                            });
                          },
                        ),
                      ),
                    )),
                    _isTap ? Wrap(
                      direction: Axis.vertical,
                        children: [Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                        )),]) : const SizedBox()
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
