import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List settings_items = const [
    SettingItems('Change Password', ''),
    SettingItems('Update Username', ''),
    SettingItems('Update Email', ''),
    SettingItems('Logout', '')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: settings_items.length,
      itemBuilder: (context, int index) => ListTile(
        tileColor: settings_items[index].title == 'Logout' ? Colors.red : Colors.lightBlueAccent,
        onTap: () {
          Navigator.pushNamed(context,
              settings_items[index].direction);
        },
        title: Text(settings_items[index].title),
      ),
      separatorBuilder: (context, index) => const Divider(thickness: 2,),
    );
  }
}

class SettingItems {
  final title;
  final direction;

  const SettingItems(this.title, this.direction);
}
