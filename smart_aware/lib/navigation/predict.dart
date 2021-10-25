import 'package:flutter/material.dart';
import 'landing.dart';

class Predict extends StatelessWidget {
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
    final List<Map<String, dynamic>> listOfThings = <Map<String, dynamic>>[
      <String, dynamic>{
        'label': 'Rendimiento académico alto',
        'backgroundHigh': Colors.orange.shade200,
        'backgroundLow': Colors.grey.shade300,
        'level': "0",
      },
      <String, dynamic>{
        'label': 'Rendimiento académico bajo',
        'backgroundHigh': Colors.orange.shade200,
        'backgroundLow': Colors.grey.shade300,
        'level': "1",
      },
    ];
    return listOfThings
        .map((Map<String, dynamic> thing) => Container(
            decoration: BoxDecoration(
              color: thing['level'] == "0"
                  ? thing['backgroundHigh']
                  : thing['backgroundLow'],
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
