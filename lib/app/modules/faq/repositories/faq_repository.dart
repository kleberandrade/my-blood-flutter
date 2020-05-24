import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_blood/app/modules/faq/models/faq_model.dart';

class FaqRepository {

  final _collection = Firestore.instance.collection('faq');

  Future<QuerySnapshot> getDocuments() {
    return _collection.getDocuments();
  }

  Future<DocumentSnapshot> getById(String id) {
    return _collection.document(id).get();
  }

  Stream<QuerySnapshot> stream() {
    return _collection.snapshots();
  }

  Future<DocumentReference> create(FaqModel faq) async {
    return _collection.add(faq.toMap());
  }

  Future update(String id, FaqModel faq) {
    return _collection.document(id).updateData(faq.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}