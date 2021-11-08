import 'package:flutter/material.dart';
import 'landing.dart';

class Predict extends StatelessWidget {
  Predict(this.prediction);

  final String prediction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 350,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Resultado',
            style: Theme.of(context).textTheme.headline4,
          ),
          ...makeWidgets(context),
          ElevatedButton(
            child: const Text('Regresar'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Landing()),
            ),
          ),
        ]),
      ),
    );
  }

  List<Widget> makeWidgets(BuildContext context) {
    final Color l1, l2;

    if (prediction == "1") {
      l1 = Colors.orange.shade200;
      l2 = Colors.grey.shade300;
    } else {
      l2 = Colors.orange.shade200;
      l1 = Colors.grey.shade300;
    }

    final List<Map<String, dynamic>> listOfThings = <Map<String, dynamic>>[
      <String, dynamic>{
        'label': 'Rendimiento académico alto',
        'level': l1,
      },
      <String, dynamic>{
        'label': 'Rendimiento académico bajo',
        "level": l2,
      },
    ];
    return listOfThings
        .map((Map<String, dynamic> thing) => Container(
            decoration: BoxDecoration(
              color: thing['level'],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 30),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Text(
                    thing['label'],
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    //style: Theme.of(context).textTheme.headline6,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )))
        .toList();
  }
}
