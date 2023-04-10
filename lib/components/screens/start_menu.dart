import 'package:flutter/material.dart';
import 'package:sportmate/components/route.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("this is ${size.width}");
    final ThemeData optionStyle = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(size.height * 0.024),
                child: RichText(
                  text: const TextSpan(
                      text: 'Sport',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: 'Mate',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w600))
                      ]),
                )),
            Container(
                margin: EdgeInsets.only(top: size.height * 0.1),
                padding: EdgeInsets.all(size.height * 0.02),
                child: Image.asset('assets/images/sport.png')),
            Padding(
                padding: EdgeInsets.only(top: 5, bottom: size.height * 0.048),
                child: const Text(
                  'Network and find like-minded sports interested people',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
            Wrap(
              direction: Axis.horizontal,
              spacing: size.width * 0.1,
              children: [
                SizedBox(
                    width: size.width * 0.382,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(sportRoute.login),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blueAccent)),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
                SizedBox(
                    width: size.width * 0.382,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(sportRoute.register),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white)),
                      child: const Text(
                        'Register',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
