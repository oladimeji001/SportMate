import 'package:flutter/material.dart';
import 'package:sportmate/components/screens/interests.dart';

class Profile extends StatelessWidget {
  Profile();
  String userName = 'John Mac';

  static const double _fillStopBlue2 = 54.93 / 100;
  static const double _fillStopOffWhite = 15.27 / 100;

  static const List<double> _linearWhiteStops = [
    0.0,
    _fillStopOffWhite,
    _fillStopBlue2
  ];

  static const Color _offWhite = Color(0xFFF3F6FF);
  static const Color _blue2 = Color(0xFF96A7D0);

  static const List<Color> _linearWhite = [Colors.white, _offWhite, _blue2];

  static const Gradient _linearWhiteGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: _linearWhiteStops,
      colors: _linearWhite);

  List profile = [
    const ProfileItems('Username', 'oladimeji001', Icons.person),
    const ProfileItems('Phone', '+234 8145304272', Icons.phone),
    ProfileItems('Interests', interests[0], Icons.interests)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.redAccent),
            currentAccountPicture: CircleAvatar(
              foregroundImage: AssetImage('assets/images/Ellipse 11.png'),
            ),
            accountName: Text('Oladimeji Michael'),
            accountEmail: Text('opeyemioladimeji.m@gmail.com')),
        ListView.builder(
            itemCount: profile.length, itemBuilder: (context, int index) {
              final select = profile[index];
              return ListTile(leading: select.icon, title: select.title, subtitle: select.detail);
        })
      ],
    ));
  }
}

class ProfileItems {
  final title;
  final detail;
  final icon;

  const ProfileItems(this.title, this.detail, this.icon);
}

/*Stack(children: [
            const Positioned(
              child: SizedBox(
                width: 428,
                height: 315,
              ),
            ),
            Positioned(
                child: Container(
              decoration: const BoxDecoration(gradient: _linearWhiteGradient),
              width: 428,
              height: 271,
            )),
            Positioned(
                left: 2,
                right: 2,
                top: 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        child: Image.asset('assets/images/Ellipse 11.png'),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          )),
                      SizedBox(
                          width: 200,
                          child: Text(
                            textAlign: TextAlign.center,
                            about,
                            style: const TextStyle(fontSize: 12),
                          ))
                    ])),
          ])*/
