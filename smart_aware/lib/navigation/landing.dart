import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 850,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset('assets/SmartLetter.png', height: 40),
          /*Text('Bienvenido/a',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),*/
          ...makeWidgets(context),
          Image.asset('assets/teachersface.png', height: 250)
        ]),
      ),
    );
  }

  List<Widget> makeWidgets(BuildContext context) {
    final List<Map<String, dynamic>> listOfThings = <Map<String, dynamic>>[
      <String, dynamic>{
        'label': 'Realizar análisis',
        'route': '/analysis',
        'background': Colors.orange.shade200,
      },
      <String, dynamic>{
        'label': 'Sobre nosotros',
        'route': '/about',
        'background': Colors.orange.shade200,
      },
    ];
    return listOfThings
        .map((Map<String, dynamic> thing) => Container(
            decoration: BoxDecoration(
              color: thing['background'],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            //margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Text(
                    thing['label'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  ElevatedButton(
                    child: const Text('Ir'),
                    onPressed: () =>
                        Navigator.pushNamed(context, thing['route']),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )))
        .toList();
  }
}
