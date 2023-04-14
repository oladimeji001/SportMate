import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportmate/components/controller/authcontroller.dart';
import 'package:sportmate/components/route.dart';

List _interests = [
  Interests('Football', false),
  Interests('Basketball', false),
  Interests('Cricket', false),
  Interests('Volleyball', false),
  Interests('Ice Hockey', false),
  Interests('Motor Sport', false),
  Interests('Rubgy', false),
  Interests('Skiing', false),
  Interests('Shooting', false),
  Interests('Bandy', false)
];

List<String> _interestsStore = [];

class Interests {
  final title;
  bool isSelect;
  Interests(this.title, this.isSelect);
}

class Interest extends ConsumerStatefulWidget {
  const Interest({super.key});

  @override
  InterestState createState() => InterestState();
}

class InterestState extends ConsumerState {
  void uploadInterests(List<String> interests){
    ref.read(authControllerProvider).uploadInterests(context, interests);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Interests'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select Interests',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height - 150),
                child: GridView.builder(
                    itemCount: _interests.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 80.0),
                    itemBuilder: (context, index) {
                      String interestsKey = _interests[index].title;
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _interests[index].isSelect =
                                  !_interests[index].isSelect;
                            });
                            _interestsStore.add(interestsKey);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _interests[index].isSelect!
                                    ? Colors.green
                                    : Colors.lightBlue,
                                border:
                                    Border.all(color: Colors.blue, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(3.0))),
                            height: 60,
                            child: Text(
                              interestsKey,
                              style: TextStyle(
                                  color: _interests[index].isSelect!
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ));
                    })),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                        uploadInterests(_interestsStore);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ]),
        ),
      ),
    );
  }
}
