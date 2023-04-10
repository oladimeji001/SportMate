import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportmate/components/utils/formfield.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail();

  @override
  UpdateEmailC createState() => UpdateEmailC();
}

class UpdateEmailC extends State {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formSizeH = size.height * 0.06;
    final formSizeW = size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Email'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Enter New Email address'),
            ),
            generalForm('E-mail', formSizeW, formSizeH, icons: Icons.email_outlined),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ],
        ));
  }
}
