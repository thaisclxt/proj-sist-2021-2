import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pscomidas/app/global/models/entities/new_card.dart';

abstract class IPaymentCardRepository {
  Future<void>? addPaymentCard(NewCard card);
  Future<List<DocumentSnapshot>> getCards();
}