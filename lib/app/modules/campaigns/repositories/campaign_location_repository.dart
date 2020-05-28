import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_location_model.dart';

class CampaignLocationRepository {
  final _collection = Firestore.instance.collection('campaigns_location');

  Future<QuerySnapshot> getDocuments() {
    return _collection.getDocuments();
  }

  Future<DocumentSnapshot> getById(String id) {
    return _collection.document(id).get();
  }

  Stream<QuerySnapshot> stream() {
    return _collection.snapshots();
  }

  Future<DocumentReference> create(CampaignLocationModel campaign) async {
    return _collection.add(campaign.toMap());
  }

  Future update(String id, CampaignLocationModel campaign) {
    return _collection.document(id).updateData(campaign.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}
