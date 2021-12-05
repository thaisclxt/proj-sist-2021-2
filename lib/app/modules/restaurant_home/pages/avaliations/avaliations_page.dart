import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'service/avaliation_service.dart';
import 'service/avaliation_service_firestore.dart';
import 'service/rating_individual.dart';
import 'service/title_rating.dart';

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
  AvaliationService service = avaliation_service_firestore();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(body: Observer(builder: (_) {
      String? restaurantId = store.profileFormController['restaurant']?.text;
      return FutureBuilder(
          future: service.getRating(restaurantId!),
          builder: (BuildContext context,
              AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Erro');
            } else if (snapshot.connectionState == ConnectionState.done) {
              final docsSize = snapshot.data!.length;
              double rating_average = 0.0;
              for (var i = 0; i < docsSize; i++) {
                if (snapshot.data!.elementAt(i).get('value') != "null") {
                  rating_average +=
                      double.parse(snapshot.data!.elementAt(i).get('value'));
                }
              }
              rating_average /= docsSize;
              return Column(
                children: [
                  TitleRating(
                      restaurantId: restaurantId,
                      rating: rating_average,
                      totalRating: docsSize),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: screen.width * .8,
                      height: 500,
                      child: ListView.builder(
                          itemCount: docsSize,
                          itemBuilder: (context, index) {
                            if (snapshot.data!.elementAt(index).get('value') !=
                                    "null" ||
                                snapshot.data!
                                        .elementAt(index)
                                        .get('comment') !=
                                    "") {
                              return Column(
                                children: [
                                  snapshot.data!
                                              .elementAt(index)
                                              .get('value') !=
                                          "null"
                                      ? ListTile(
                                          title: Text(snapshot.data!
                                              .elementAt(index)
                                              .get('comment')),
                                          subtitle: RatingIndividual(
                                              rating: double.parse(snapshot
                                                  .data!
                                                  .elementAt(index)
                                                  .get('value'))),
                                        )
                                      : ListTile(
                                          title: Text(snapshot.data!
                                              .elementAt(index)
                                              .get('comment')),
                                          subtitle: const RatingIndividual(
                                            rating: 0,
                                          ),
                                        ),
                                  const Divider(
                                    height: 10,
                                    thickness: 2,
                                    indent: 20,
                                    endIndent: 20,
                                  )
                                ],
                              );
                            }
                            return const SizedBox();
                          }),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }));
  }
}
