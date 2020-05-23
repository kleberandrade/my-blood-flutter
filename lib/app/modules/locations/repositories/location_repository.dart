import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_blood/app/modules/locations/models/location_model.dart';

class LocationRepository {
  final _collection = Firestore.instance.collection('locations');

  Future<QuerySnapshot> getDocuments() {
    return _collection.getDocuments();
  }

  Future<DocumentSnapshot> getById(String id) {
    return _collection.document(id).get();
  }

  Stream<QuerySnapshot> stream() {
    return _collection.snapshots();
  }

  Future<DocumentReference> create(LocationModel location) async {
    return _collection.add(location.toMap());
  }

  Future update(String id, LocationModel location) {
    return _collection.document(id).updateData(location.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}
