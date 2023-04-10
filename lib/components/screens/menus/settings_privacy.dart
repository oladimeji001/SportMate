import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/chg_pass.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/logout.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/updemail.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/updusername.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List setting_items = const [
    SettingItems('Change Password', ChangePassword()),
    SettingItems('Update Username', UpdateUser()),
    SettingItems('Update Email', UpdateEmail()),
    SettingItems('Logout', LogOut())
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: setting_items.length,
      itemBuilder: (context, int index) => ListTile(
        onTap: () {
          Navigator.pushNamed(context, setting_items[index].direction);
        },
        title: Text(setting_items[index].title),
      ),
      //separatorBuilder: (context, index) => const Divider(thickness: 2,),
    );
  }
}

class SettingItems {
  final title;
  final direction;

  const SettingItems(this.title, this.direction);
}
