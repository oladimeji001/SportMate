import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile();
  String userName = 'John Mac';
  String about = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  static const double _fillStopBlue2 = 54.93 /100;
  static const double _fillStopOffWhite = 15.27 /100;

  static const List<double> _linearWhiteStops = [ 0.0, _fillStopOffWhite,  _fillStopBlue2];

  static const Color _offWhite = Color(0xFFF3F6FF);
  static const Color _blue2 = Color(0xFF96A7D0);

  static const List<Color> _linearWhite = [Colors.white, _offWhite, _blue2];

  static const Gradient _linearWhiteGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,stops: _linearWhiteStops,colors: _linearWhite);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
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
          ])
        ],
      ),
    );
  }
}
