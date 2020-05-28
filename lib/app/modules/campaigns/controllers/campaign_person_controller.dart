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
  ObservableList<CampaignPersonModel> campaigns =
      ObservableList<CampaignPersonModel>();

  @action
  void setBusy(value) => busy = value;

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
  add(CampaignPersonModel campaign) async {
    campaigns.add(campaign);
  }

  @action
  clear() async {
    campaigns.clear();
  }
}