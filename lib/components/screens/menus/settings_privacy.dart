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
    return ListView.builder(
      itemCount: setting_items.length,
      itemBuilder: (context, int index) => ListTile(
        onTap: () {
          if (setting_items[index] != 'Logout'){
            Navigator.pushNamed(context, sportRoute.verify_pass,arguments: setting_items[index]);
          }
          else{
            ref.read(authControllerProvider).signOut(context);
          }
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
