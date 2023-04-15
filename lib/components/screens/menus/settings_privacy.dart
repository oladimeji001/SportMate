import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/route.dart';

import '../../controller/authcontroller.dart';

class Settings extends ConsumerWidget {
  Settings({super.key});

  final List setting_items = [
    SettingItems('Change Password', sportRoute.chgpass),
    SettingItems('Update Username', sportRoute.update_user),
    SettingItems('Update Email', sportRoute.update_email),
    const SettingItems('Logout', null)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ListTile(
          title: Text(setting_items[0].title),
          onTap: () => Navigator.pushNamed(context, sportRoute.verify_pass,
              arguments: setting_items[0]),
        ),
        ListTile(
          title: Text(setting_items[1].title),
          onTap: () => Navigator.pushNamed(context, sportRoute.verify_pass,
              arguments: setting_items[1]),
        ),
        ListTile(
          title: Text(setting_items[2].title),
          onTap: () => Navigator.pushNamed(context, sportRoute.verify_pass,
              arguments: setting_items[2]),
        ),
        ListTile(
          title: Text(setting_items[3].title),
          onTap: () => ref.read(authControllerProvider).signOut(context),
        )
      ],
    );
    /**return ListView.builder(
      itemCount: setting_items.length,
      itemBuilder: (context, int index) => ListTile(
        onTap: () {
          if (setting_items[index] == 'Logout'){

            return;
          }
          Navigator.pushNamed(context, sportRoute.verify_pass,arguments: setting_items[index]);
        },
        title: Text(setting_items[index].title),
      ),
      //separatorBuilder: (context, index) => const Divider(thickness: 2,),
    );**/
  }
}

class SettingItems {
  final title;
  final direction;

  const SettingItems(this.title, this.direction);
}
