import 'package:flutter/material.dart';
import 'package:sportmate/components/route.dart';
import 'package:sportmate/components/screens/menus/settings_privacy/logout.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List setting_items = [
    SettingItems('Change Password', sportRoute.chgpass),
    SettingItems('Update Username', sportRoute.update_user),
    SettingItems('Update Email', sportRoute.update_email),
    const SettingItems('Logout', LogOut())
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: setting_items.length,
      itemBuilder: (context, int index) => ListTile(
        onTap: () {
          if (setting_items[index] == 'Logout'){
            setting_items[index].direction;
          }
          Navigator.pushNamed(context, sportRoute.verify_pass,arguments: setting_items[index]);
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
