import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AvaliationService {
  Future<List<DocumentSnapshot>> getRating(String restaurantId);
}
