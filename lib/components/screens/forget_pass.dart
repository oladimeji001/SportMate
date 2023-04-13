import 'package:flutter/material.dart';
import 'package:sportmate/components/route.dart';

class Pass extends StatefulWidget {
  const Pass({super.key});
  @override
  PassReset createState() => PassReset();
}

class PassReset extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('Verification'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
           const Padding(padding: EdgeInsets.all(10.0),child:Text(
              'Verification link will be sent to ',
              style: TextStyle(fontSize: 15),
            )),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Text('Tap proceed button to continue')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 150,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, sportRoute.chgpass);
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
