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

    final bottomBarItems = [
      MyTabItem(
          'Discover',
          Icons.wifi_tethering_outlined,
          Text(
            'Discover Menu',
            style: optionStyle,
          )),
      MyTabItem(
          'Buddies',
          Icons.group_outlined,
          Text(
            'Buddies Menu',
            style: optionStyle,
          )),
      MyTabItem('Profile', Icons.person, Profile()),
      MyTabItem('Settings & Privacy', Icons.settings, Settings()),
    ];

    final itemIndex = ref.watch(_onItemTapped);

    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          titleSpacing: 30,
          title: Text(bottomBarItems[_selectedIndex].title)),
      body: Center(
          child: bottomBarItems[_selectedIndex]
              .direction), //Selects Widget from dictionary value stored in itemIndex list
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.indigo,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: bottomBarItems
            .map((items) => BottomNavigationBarItem(
                label: items.title,
                backgroundColor: Colors.blueAccent,
                icon: Icon(items.icon,)))
            .toList(),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class MyTabItem {
  final String title;
  final IconData icon;
  final Widget direction;

  const MyTabItem(this.title, this.icon, this.direction);
}
