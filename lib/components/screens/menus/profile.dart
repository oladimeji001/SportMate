import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/authcontroller.dart';
import 'package:sportmate/components/screens/interests.dart';

import '../pickimageFromGallery.dart';

class Profile extends ConsumerStatefulWidget {
  Profile();

  @override
  ProfileS createState() => ProfileS();
}

class ProfileS extends ConsumerState {
  File? image;

  String? getProfilepics(BuildContext context){
    String? profilePics;
    final profile = ref.watch(authControllerProvider).getProfile(context);
    profile.then((value) => profilePics = value);
    return profilePics;
  }
  String? getUserName(BuildContext context){
    final userName = ref.watch(authControllerProvider).getUserName(context);
    return userName;
  }

  String? getphoneNumber(BuildContext context){
      final phoneNumber = ref.read(authControllerProvider).getphoneNumber(context);
      return phoneNumber;
  }
  String? getEmailAddress(BuildContext context){
    final emailAddress = ref.watch(authControllerProvider).getEmailAddress(context);
    return emailAddress;
  }

  List? interests(BuildContext context){
    List? interestsValue;
    final interestsWatch = ref.watch(authControllerProvider).interests(context);
    interestsWatch.then((value) => interestsValue = value);
    return interestsValue;
  }



  @override
  Widget build(BuildContext context) {
    String? userPics = getProfilepics(context);
    List profile = [
      ProfileItems('Username', getUserName(context), Icons.person),
       ProfileItems('Phone', getphoneNumber(context), Icons.phone),
       ProfileItems('Interests', interests(context)?.join(' '), Icons.interests)
    ];
    return Column(
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white10),
            currentAccountPicture: userPics == null
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
                  backgroundImage: NetworkImage(userPics),
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
    ref.read(authControllerProvider).profilePicsUpload(context, image!,);
    setState(() {});

  }
}

class ProfileItems {
  final title;
  final detail;
  final icon;

  const ProfileItems(this.title, this.detail, this.icon);
}
