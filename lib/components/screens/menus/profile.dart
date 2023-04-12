import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/interests.dart';

class Profile extends StatelessWidget {
  Profile();


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
            currentAccountPicture: CircleAvatar(
              backgroundImage: const AssetImage('assets/images/Ellipse 11.png'),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.blueGrey,
                      ))),
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
}

class ProfileItems {
  final title;
  final detail;
  final icon;

  const ProfileItems(this.title, this.detail, this.icon);
}

