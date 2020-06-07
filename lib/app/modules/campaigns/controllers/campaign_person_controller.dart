import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_person_model.dart';
import 'package:my_blood/app/modules/campaigns/repositories/campaign_person_repository.dart';

part 'campaign_person_controller.g.dart';

class CampaignPersonController = _CampaignPersonControllerBase with _$CampaignPersonController;

abstract class _CampaignPersonControllerBase with Store {
   CampaignPersonRepository _repository;

  _CampaignPersonControllerBase() {
    _repository = new CampaignPersonRepository();
  }

  @observable
  bool busy = false;

  @observable
  CampaignPersonModel campaign = CampaignPersonModel();

  @observable
  ObservableList<CampaignPersonModel> campaigns =
      ObservableList<CampaignPersonModel>();

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
            .map((snapshot) => CampaignPersonModel.fromMap(snapshot.data))
            .toList()
            .asObservable();
      }
    } catch (e) {
      campaigns = List<CampaignPersonModel>();
    }

    setBusy(false);
  }

  @action
  Future create(CampaignPersonModel campaign) async {
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
    campaign = new CampaignPersonModel();
  }
}