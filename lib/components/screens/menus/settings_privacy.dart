import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {},
          title: const Text('Change Password'),
        ),
        ListTile(
          onTap: () {},
          title: const Text('Update Email'),
        ),
        ListTile(
          onTap: () {},
          title: const Text('Update Username'),
        ),
        ListTile(
          onTap: () {},
          title: const Text('Logout'),
        )
      ],
    );
  }
}
