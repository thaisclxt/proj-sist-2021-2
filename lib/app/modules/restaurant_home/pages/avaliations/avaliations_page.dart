import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/service/avaliation_service.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/service/avaliation_service_firestore.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';

class AvaliationsPage extends StatefulWidget {
  static String get routeName => '/avaliations';
  final String title;
  const AvaliationsPage({Key? key, this.title = 'Avaliations Page'})
      : super(key: key);
  @override
  AvaliationsPageState createState() => AvaliationsPageState();
}

class AvaliationsPageState extends State<AvaliationsPage> {
  final RestaurantHomeStore store = Modular.get<RestaurantHomeStore>();
  AvaliationService service = AvaliationServiceFirestore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: service.getAvaliation(),
      builder: (BuildContext context,
          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Erro');
        } else if (snapshot.connectionState == ConnectionState.done) {
          print('Resultado: \n $snapshot');
          return Text('qualquer coisa');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
