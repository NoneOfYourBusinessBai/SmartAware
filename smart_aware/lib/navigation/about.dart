import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sobre nosotros',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              SizedBox(height: 10),
              Text(
                  'SmartAware, es una aplicación que predice el rendimiento académico de un estudiante con base en los valores introducidos por el usuario. Las predicciones que SmartAware hace tienen un Accuracy de x, trabajada con la . SmartAware fue desarrollada por estudiantes de Ingeniería',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(
                  'Los datos utlizados para realizar las predicciones fueron tomados de: LINK. La investigación fue hecha en (país) Esta aplicación fue parte de una asignatura escolar, por lo que no nos hacemos responsables de la diferencia de datos',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center),
              Image.asset('assets/student2.png', height: 300)
            ]),
      ),
    );
  }
}
