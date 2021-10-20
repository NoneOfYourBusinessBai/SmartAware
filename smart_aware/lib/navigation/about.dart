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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sobre nosotros',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Text(
                'SmartAware, es una aplicación que predice el rendimiento académico de un estudiante con base en los valores introducidos por el usuario. Las predicciones que SmartAware hace tienen una Accuracy de x, y trabajada con la red neuronal Feed Forward BackPropagation. SmartAware fue desarrollada por estudiantes de Ingeniería de la Universidad de Montemorelos',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10),
            ]),
      ),
    );
  }
}
