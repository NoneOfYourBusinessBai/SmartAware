import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sobre nosotros',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              SizedBox(height: 10),
              Text(
                  'SmartAware es una aplicación que tiene como objetivo ayudar a un maestro a determinar el rendimiento académico de sus estudiantes a los largo del curso mediante un clasificador.',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify),
              SizedBox(height: 10),
              Text(
                  'Los datos utilizados para realizar la clasificación se encontraron en el artículo que lleva por nombre:  ',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify),
              InkWell(
                  child: const Text(
                      'Extracción de datos educativos para predecir el rendimiento académico del estudiante utilizando métodos de conjunto',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.orange)),
                  onTap: () => launch(
                      'http://article.nadiapub.com/IJDTA/vol9_no8/13.pdf')),
              SizedBox(height: 10),
              Text(
                  'Para entrenar el modelo, se decidió utilizar la clase de Decision trees de la librería de Sci-Kit Learn. Una vez entrenado el modelo, se obtuvieron los siguientes resultados:',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.justify),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: const [
                  TableRow(children: [
                    Text(
                      "Clasificaciones",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                    ),
                    Text("Accuracy",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0),
                    Text("Precision",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0),
                    Text("Recall",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0),
                    Text("f1-score",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0),
                  ]),
                  TableRow(children: [
                    Text("Rendimiento alto",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.95",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.92",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.96",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.94",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                  ]),
                  TableRow(children: [
                    Text("Rendimiento bajo",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.95",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.97",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.95",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                    Text("0.96",
                        textAlign: TextAlign.center, textScaleFactor: 1.0),
                  ]),
                ],
              ),
              SizedBox(height: 10),
              Text(
                  ' Si le gustaría ver el documento completo de este proyecto: ',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center),
              InkWell(
                  child: const Text('Click aquí',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.orange)),
                  onTap: () => launch(
                      'https://docs.google.com/document/d/1NN-Nmb1F4GlOSDTqPOhjASbp3BwErJivTOiNbp2g0fk/edit?usp=sharing')),
              Image.asset('assets/student2.png', height: 300),
            ]),
      ),
    );
  }
}
