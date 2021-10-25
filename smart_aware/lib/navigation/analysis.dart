import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'predict.dart';

class Analysis extends StatelessWidget {
  final List<Map<String, dynamic>> itemSexo = [
    {
      'value': '1',
      'label': 'Hombre',
    },
    {
      'value': '2',
      'label': 'Mujer',
    },
  ];

  final List<Map<String, dynamic>> itemSem = [
    {
      'value': '1',
      'label': '1',
    },
    {
      'value': '2',
      'label': '2',
    },
  ];

  final List<Map<String, dynamic>> itemPadre = [
    {
      'value': '0',
      'label': 'Mala',
    },
    {
      'value': '1',
      'label': 'Buena',
    },
  ];

  final List<Map<String, dynamic>> itemAusencia = [
    {
      'value': '0',
      'label': 'Menos de 7',
    },
    {
      'value': '1',
      'label': 'Más de 7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Análisis',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Text(
                'Seleccione los valores que más se adecúen a la situación',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: '',
                icon: Icon(Icons.account_box),
                labelText: 'Sexo',
                items: itemSexo,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 10),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: '',
                icon: Icon(Icons.format_list_numbered),
                labelText: 'No. de semestre',
                items: itemSem,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 10),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: '',
                icon: Icon(Icons.accessibility),
                labelText: 'Participación del padre',
                items: itemPadre,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 10),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: '',
                icon: Icon(Icons.calendar_today),
                labelText: 'Días ausente',
                items: itemAusencia,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20),
              Text(
                'Rellene los campos',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.format_list_numbered),
                  border: OutlineInputBorder(),
                  labelText: 'No. de Grado',
                ),
              ),
              SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_search),
                  border: OutlineInputBorder(),
                  labelText: 'No. manos levantadas',
                ),
              ),
              SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_a_photo),
                  border: OutlineInputBorder(),
                  labelText: 'No. de recursos visitados',
                ),
              ),
              SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_alert),
                  border: OutlineInputBorder(),
                  labelText: 'No. de anuncios vistos',
                ),
              ),
              SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_comment),
                  border: OutlineInputBorder(),
                  labelText: 'Discussion',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Analizar alumno'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Predict()),
                ),
              ),
            ]),
      ),
    );
  }
}
