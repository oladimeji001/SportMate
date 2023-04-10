import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/route.dart';

final interests = [
  'Football, Basketball, Cricket, Volleyball',
  'Ice Hockey',
  'Motor Sport',
  'Rubgy'
];

class Interest extends ConsumerStatefulWidget {
  const Interest({super.key});

  @override
  InterestState createState() => InterestState();
}

class InterestState extends ConsumerState {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: interests.length,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: isSelected ? Colors.redAccent : Colors.lightBlue,
                      border: Border.all(color: Colors.blue, width: 2.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0))),
                  height: 20,
                  width: 200,
                  child: Text(
                    interests[index],
                    style: TextStyle(
                        color: isSelected ? Colors.black : Colors.deepOrange,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, sportRoute.main_menu),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ])));
  }
}
