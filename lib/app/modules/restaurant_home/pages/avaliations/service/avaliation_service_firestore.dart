import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/modules/restaurant_home/pages/avaliations/service/avaliation_service.dart';

class AvaliationServiceFirestore extends AvaliationService {
  @override
  Future<List<DocumentSnapshot>> getAvaliation() async {
    /*QuerySnapshot<Map<String, dynamic>> querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: searchTitle)
        .get();

    return querySnapshot.docs.map((doc) {
      Product product = Product.fromMap(doc.data(), doc.id);*/

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("order").get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    return documents;
  }
}
