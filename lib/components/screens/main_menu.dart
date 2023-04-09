import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'menus/profile.dart';
import 'menus/settings_privacy.dart';

int _selectedIndex = 0;
final _onItemTapped = StateProvider((ref) => _selectedIndex);

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({super.key});

  @override
  ConsumerState<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends ConsumerState<MainMenu> {
  @override
  Widget build(BuildContext context) {
    final TextStyle? optionStyle = Theme.of(context).textTheme.displayMedium;

    final List<Map<String, Widget>> widgetOptions = <Map<String, Widget>>[
      {
        'Discover': Text('Discover Menu', style: optionStyle,
        )
      },
      {
        'Buddies': Text('Buddies Menu', style: optionStyle)
      },
      {
        'Profile': const Profile()
      },
      {
        'Settings & Privacy': const Settings()
      }
    ];

    final itemIndex = ref.watch(_onItemTapped);

    return Scaffold(
      appBar: AppBar(title: Text(widgetOptions[_selectedIndex].keys as String)),
      body: Center(
          child: widgetOptions[_selectedIndex][widgetOptions[_selectedIndex]
              .keys]), //Selects Widget from dictionary value stored in itemIndex list
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.broadcast_on_home_outlined), label: 'Discover'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined), label: 'Buddies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings & Privacy')
        ],
        onTap: (index) {
          _selectedIndex = index;
        },
        currentIndex: itemIndex,
        selectedItemColor: Colors.lightGreen,
        backgroundColor: Colors.lime,
      ),
    );
  }
}
