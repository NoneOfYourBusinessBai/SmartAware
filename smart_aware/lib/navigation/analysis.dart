import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:select_form_field/select_form_field.dart';
import 'predict.dart';

Future<String> createPrediction(Prediction p) async {
  final response = await http.post(
    Uri.parse('https://smart-aware.herokuapp.com/smart_aware_app'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'gender': p.gender,
      'gradeID': p.gradeID,
      'semester': p.semester,
      'raisedHands': p.raisedHands,
      'visitedResources': p.visitedResources,
      'announcementsView': p.announcementsView,
      'discussion': p.discussion,
      'parentParticipating': p.parentParticipating,
      'absenceDays': p.absenceDays
    }),
  );

  developer.log(jsonDecode(response.body)['predict'], name: 'post response');

  if (response.statusCode == 200) {
    return (jsonDecode(response.body)['predict']);
  } else {
    throw Exception('Failed to create Prediction.');
  }
}

class Prediction {
  int gender;
  int gradeID;
  int semester;
  int raisedHands;
  int visitedResources;
  int announcementsView;
  int discussion;
  int parentParticipating;
  int absenceDays;
  final String predict;

  Prediction(
      {required this.gender,
      required this.gradeID,
      required this.semester,
      required this.raisedHands,
      required this.visitedResources,
      required this.announcementsView,
      required this.discussion,
      required this.parentParticipating,
      required this.absenceDays,
      required this.predict});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      gender: json['gender'],
      gradeID: json['gradeID'],
      semester: json['semester'],
      raisedHands: json['raisedHands'],
      visitedResources: json['visitedResources'],
      announcementsView: json['announcementsView'],
      discussion: json['discussion'],
      parentParticipating: json['parentParticipating'],
      absenceDays: json['absenceDays'],
      predict: json['predict'],
    );
  }
}

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  _AnalysisState createState() {
    return _AnalysisState();
  }
}

class _AnalysisState extends State<Analysis> {
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

  final TextEditingController gradeIdController = TextEditingController();
  final TextEditingController raisedHandsController = TextEditingController();
  final TextEditingController visitedResourcesController =
      TextEditingController();
  final TextEditingController announcementsViewController =
      TextEditingController();
  final TextEditingController discussionController = TextEditingController();
  final TextEditingController absenceDaysController = TextEditingController();
  final TextEditingController parentParticipatingController =
      TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  Future<String>? _futurePrediction;

  final Prediction p = Prediction(
      gender: 1,
      gradeID: 4,
      semester: 1,
      raisedHands: 10,
      visitedResources: 7,
      announcementsView: 0,
      discussion: 30,
      parentParticipating: 0,
      absenceDays: 1,
      predict: "0");

/*
  final Prediction p = Prediction(
      gender: 2,
      gradeID: 8,
      semester: 1,
      raisedHands: 62,
      visitedResources: 70,
      announcementsView: 44,
      discussion: 60,
      parentParticipating: 0,
      absenceDays: 1,
      predict: "1");
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      body: SingleChildScrollView(
        /*alignment: Alignment.center,*/
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child:
            (_futurePrediction == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Análisis',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        Text(
          'Seleccione los valores que más se adecúen a la situación de su alumno',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 10),
        SelectFormField(
          controller: genderController,
          type: SelectFormFieldType.dropdown,
          initialValue: null,
          icon: const Icon(Icons.account_box),
          labelText: 'Sexo',
          items: itemSexo,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        const SizedBox(height: 10),
        SelectFormField(
          controller: semesterController,
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: null,
          icon: const Icon(Icons.format_list_numbered),
          labelText: 'No. de semestre',
          items: itemSem,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        const SizedBox(height: 10),
        SelectFormField(
          controller: parentParticipatingController,
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: null,
          icon: const Icon(Icons.accessibility),
          labelText: 'Participación del padre',
          items: itemPadre,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        const SizedBox(height: 10),
        SelectFormField(
          controller: absenceDaysController,
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: null,
          icon: const Icon(Icons.calendar_today),
          labelText: 'Días ausente',
          items: itemAusencia,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        const SizedBox(height: 20),
        Text('Número de grado escolar (1-12)',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.left),
        TextField(
          controller: gradeIdController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.format_list_numbered),
            /*border: OutlineInputBorder(),*/
            labelText: 'No. de Grado',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Número de veces que el alumno levantó la mano al día',
          style: Theme.of(context).textTheme.caption,
        ),
        TextField(
          controller: raisedHandsController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_search),
            /*border: OutlineInputBorder(),*/
            labelText: 'No. manos levantadas',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Número de recursos que el alumno visitó',
          style: Theme.of(context).textTheme.caption,
        ),
        TextField(
          controller: visitedResourcesController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.add_a_photo),
            /*border: OutlineInputBorder(),*/
            labelText: 'No. de recursos visitados',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Número de anuncios vistos por el alumno',
          style: Theme.of(context).textTheme.caption,
        ),
        TextField(
          controller: announcementsViewController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.add_alert),
            /*border: OutlineInputBorder(),*/
            labelText: 'No. de anuncios vistos',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Número de veces que el alumno compartió su opinión',
          style: Theme.of(context).textTheme.caption,
        ),
        TextField(
          controller: discussionController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.add_comment),
            /*border: OutlineInputBorder(),*/
            labelText: 'Discussion',
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            /*p.gradeID = int.parse(gradeIdController.text);
            p.raisedHands = int.parse(raisedHandsController.text);
            p.visitedResources = int.parse(visitedResourcesController.text);
            p.announcementsView = int.parse(announcementsViewController.text);
            p.discussion = int.parse(discussionController.text);
            p.absenceDays = int.parse(absenceDaysController.text);
            p.parentParticipating =
                int.parse(parentParticipatingController.text);
            p.semester = int.parse(semesterController.text);
            p.gender = int.parse(genderController.text);*/

            setState(() {
              // _futurePrediction =
              createPrediction(p).then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Predict(value)),
                  ));

              // developer.log(_futurePrediction.toString(),
              //    name: 'future to string');
/*
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Predict(_futurePrediction.toString())),
              );
              */
            });
          },
          child: const Text('Analizar alumno'),
        ),
      ],
    );
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
      future: _futurePrediction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
