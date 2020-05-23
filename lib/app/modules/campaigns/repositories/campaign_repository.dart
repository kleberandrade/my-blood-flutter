import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_model.dart';

class CampaignRepository {
  final _collection = Firestore.instance.collection('campaigns');

  Future<QuerySnapshot> getDocuments() {
    return _collection.getDocuments();
  }

  Future<DocumentSnapshot> getById(String id) {
    return _collection.document(id).get();
  }

  Stream<QuerySnapshot> stream() {
    return _collection.snapshots();
  }

  Future<DocumentReference> create(CampaignModel campaign) async {
    return _collection.add(campaign.toMap());
  }

  Future update(String id, CampaignModel campaign) {
    return _collection.document(id).updateData(campaign.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}
