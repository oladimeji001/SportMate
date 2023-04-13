import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/screens/pickimageFromGallery.dart';
import 'package:sportmate/components/utils/formfield.dart';

File? image;

class UserNameO extends StatefulWidget {
  const UserNameO({super.key});

  @override
  State createState() => UserName();
}

class UserName extends State {
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
              image == null
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white10,
                        backgroundImage:
                            const AssetImage('assets/images/noprofile.png'),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: const Icon(Icons.add_a_photo),
                              onPressed: selectImage,
                            )),
                      ))
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white10,
                        backgroundImage: FileImage(image!),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ),
                              onPressed: selectImage,
                            )),
                      )),
              Align(
                  alignment: const Alignment(-0.1, 0),
                  child: generalForm('Username', 200, 50,
                      icons: Icons.person, maxLength: 20)),
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

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }
}
