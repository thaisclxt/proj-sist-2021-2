import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/restaurant_home/restaurant_home_store.dart';
import 'avaliation_service.dart';

class avaliation_service_firestore extends AvaliationService {
  @override
  Future<List<DocumentSnapshot>> getRating(String restaurantId) async {
    CollectionReference collectionReferenceOrder =
        FirebaseFirestore.instance.collection('order');
    CollectionReference collectionReferenceRating =
        FirebaseFirestore.instance.collection('rating');

    QuerySnapshot querySnapshot = await collectionReferenceOrder
        .where("restaurant_id", isEqualTo: restaurantId)
        .get();

    List<String> listRating = [];
    List<DocumentSnapshot> listSnapshotRating = [];

    for (var i = 0; i < querySnapshot.size; i++) {
      if (querySnapshot.docs.elementAt(i).get('rating') != "") {
        listRating.add(querySnapshot.docs.elementAt(i).get('rating'));
      }
    }

    for (var i = 0; i < listRating.length; i++) {
      DocumentSnapshot snapshot =
          await collectionReferenceRating.doc(listRating[i]).get();

      listSnapshotRating.add(snapshot);
    }

    return listSnapshotRating;
  }
}
