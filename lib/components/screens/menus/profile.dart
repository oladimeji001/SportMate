import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/interests.dart';

import '../pickimageFromGallery.dart';

class Profile extends StatefulWidget {
  Profile();

  @override
  ProfileS createState() => ProfileS();
}

class ProfileS extends State {
  File? image;

  List profile = [
    const ProfileItems('Username', 'oladimeji001', Icons.person),
    const ProfileItems('Phone', '+234 8145304272', Icons.phone),
    const ProfileItems('Interests', 'Football', Icons.interests)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white10),
            currentAccountPicture: image == null
                ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white10,
                  backgroundImage:
                      const AssetImage('assets/images/noprofile.png'),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(iconSize: 20,
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: selectImage,
                      )),
                )
                : CircleAvatar(
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
                ),
            accountName: const Text(
              'Oladimeji Michael',
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
            accountEmail: const Text(
              'opeyemioladimeji.m@gmail.com',
              style: TextStyle(color: Colors.redAccent),
            )),
        ListView.builder(
            itemCount: profile.length,
            shrinkWrap: true,
            itemBuilder: (context, int index) {
              final select = profile[index];
              return ListTile(
                  leading: Icon(select.icon),
                  title: Text(select.title),
                  subtitle: Text(select.detail));
            })
      ],
    );
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }
}

class ProfileItems {
  final title;
  final detail;
  final icon;

  const ProfileItems(this.title, this.detail, this.icon);
}
