import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_model.dart';
import 'package:my_blood/app/modules/campaigns/repositories/campaign_repository.dart';
part 'campaign_controller.g.dart';

class CampaignController = _CampaignControllerBase with _$CampaignController;

abstract class _CampaignControllerBase with Store {
  CampaignRepository _repository;

  _CampaignControllerBase() {
    _repository = new CampaignRepository();
  }

  @observable
  bool busy = false;

  @observable
  ObservableList<CampaignModel> campaigns = ObservableList<CampaignModel>();

  @action
  void setBusy(value) => busy = value;

  @action
  Future getCampaigns() async {
    setBusy(true);
    try {
      final campaignDocuments = await _repository.getDocuments();
      if (campaignDocuments.documents.isNotEmpty) {
        campaigns = campaignDocuments.documents
            .map((snapshot) => CampaignModel.fromMap(snapshot.data))
            .toList()
            .asObservable();
      }
    } catch (e) {
      campaigns = List<CampaignModel>();
    }

    setBusy(false);
  }

  @action
  add(CampaignModel campaign) async {
    campaigns.add(campaign);
  }

  @action
  clear() async {
    campaigns.clear();
  }
}
