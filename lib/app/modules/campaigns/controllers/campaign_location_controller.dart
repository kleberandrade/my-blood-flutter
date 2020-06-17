import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_location_model.dart';
import 'package:my_blood/app/modules/campaigns/repositories/campaign_location_repository.dart';

part 'campaign_location_controller.g.dart';

class CampaignLocationController = _CampaignLocationControllerBase
    with _$CampaignLocationController;

abstract class _CampaignLocationControllerBase with Store {
  CampaignLocationRepository _repository;

  _CampaignLocationControllerBase() {
    _repository = new CampaignLocationRepository();
  }

  @observable
  bool busy = false;

  @observable
  CampaignLocationModel campaign = CampaignLocationModel();

  @observable
  ObservableList<CampaignLocationModel> campaigns =
      ObservableList<CampaignLocationModel>();

  @action
  void setBusy(value) => busy = value;

  @action
  void setPicture(String pictureUrl) {
    campaign.photoPath = pictureUrl;
  }

  @action
  Future fetch() async {
    setBusy(true);
    try {
      final campaignDocuments = await _repository.getDocuments();
      if (campaignDocuments.documents.isNotEmpty) {
        campaigns = campaignDocuments.documents
            .map((snapshot) => CampaignLocationModel.fromMap(snapshot.data))
            .toList()
            .asObservable();
      }
    } catch (e) {
      campaigns = List<CampaignLocationModel>();
    }

    setBusy(false);
  }

  @action
  Future create(CampaignLocationModel campaign) async {
    setBusy(true);
    await _repository.create(campaign);
    campaigns.add(campaign);
    setBusy(false);
  }

  @action
  Future save() async {
    create(campaign);
  }

  @action
  clearLocations() async {
    campaigns.clear();
  }

  @action
  clearLocation() async {
    campaign = new CampaignLocationModel();
  }
}
