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

  Map<String, dynamic>? getProfile() {
    final profile = ref.watch(getProfileProvider).value;
    return profile;
  }

  String? getUserName(BuildContext context) {
    final userName = ref.watch(authControllerProvider).getUserName(context);
    return userName;
  }

  String? getphoneNumber(BuildContext context) {
    final phoneNumber =
        ref.read(authControllerProvider).getphoneNumber(context);
    return phoneNumber;
  }

  String? getEmailAddress(BuildContext context) {
    final emailAddress =
        ref.watch(authControllerProvider).getEmailAddress(context);
    return emailAddress;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? userData = getProfile();
    String? getEmail = getEmailAddress(context);
    List interestsData = userData!['interests'];
    String userPics = userData!['profile_pics'];
    List profile = [
      ProfileItems('Username', getUserName(context), Icons.person),
      ProfileItems('Phone', getphoneNumber(context), Icons.phone),
      ProfileItems('Interests', interestsData.join(', '), Icons.interests)
    ];
    return Column(
      children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white10),
            currentAccountPicture: userPics == '' || userPics == null
                ? CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white10,
                    backgroundImage: const NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/sportmate-2478e.appspot.com/o/generalPic%2Fnoprofile.png?alt=media&token=90de81ee-a131-4811-a103-ce27afeb8308'),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          iconSize: 20,
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
            accountEmail: Text(
              '$getEmail',
              style: const TextStyle(color: Colors.redAccent),
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
    print(image);
    ref.read(authControllerProvider).profilePicsUpload(context, image!);
    setState(() {});
  }
}

class ProfileItems {
  final title;
  final detail;
  final icon;

  const ProfileItems(this.title, this.detail, this.icon);
}
