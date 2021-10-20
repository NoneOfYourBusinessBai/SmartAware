import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 350,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Bienvenid@',
            style: Theme.of(context).textTheme.headline4,
          ),
          ...makeWidgets(context)
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
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 30),
            child: GestureDetector(
              child: Row(
                children: <Widget>[
                  Text(
                    thing['label'],
                    style: Theme.of(context).textTheme.headline6,
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
