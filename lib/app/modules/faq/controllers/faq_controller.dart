import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/faq/models/faq_model.dart';
import 'package:my_blood/app/modules/faq/repositories/faq_repository.dart';
part 'faq_controller.g.dart';

class FaqController = _FaqControllerBase with _$FaqController;

abstract class _FaqControllerBase with Store {
  FaqRepository _repository;

  _FaqControllerBase() {
    _repository = new FaqRepository();
  }

  @observable
  bool busy = false;

  @observable
  ObservableList<FaqModel> faqList = ObservableList<FaqModel>();

  @action
  void setBusy(value) => busy = value;

  @action
  Future fetch() async {
    setBusy(true);
    try {
      final faqDocuments = await _repository.getDocuments();
      if (faqDocuments.documents.isNotEmpty) {
        faqList = faqDocuments.documents
            .map((snapshot) => FaqModel.fromMap(snapshot.data))
            .toList()
            .asObservable();
      }
    } catch (e) {
      faqList = List<FaqModel>();
    }
    setBusy(false);
  }

  @action
  add(FaqModel faq) async {
    faqList.add(faq);
  }

  @action
  clear() async {
    faqList.clear();
  }
}
