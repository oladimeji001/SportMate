import 'package:flutter/material.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/utils/formfield.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Set Up Username '),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Please provide a username and your profile photo',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        const AssetImage('assets/images/Ellipse 11.png'),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo_outlined),
                          onPressed: () {},
                        )),
                  )),
              Align(
                  alignment: const Alignment(-0.1, 0),
                  child: generalForm('Username', 200, 50, icons: Icons.person, maxLength: 20)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(sportRoute.main_menu);
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
