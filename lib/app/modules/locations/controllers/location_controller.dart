import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/locations/models/location_model.dart';
import 'package:my_blood/app/modules/locations/repositories/location_repository.dart';

part 'location_controller.g.dart';

class LocationController = _LocationControllerBase with _$LocationController;

abstract class _LocationControllerBase with Store {
  LocationRepository _repository;

  _LocationControllerBase() {
    _repository = new LocationRepository();
  }

  @observable
  bool busy = false;

  @observable
  ObservableList<LocationModel> locations = ObservableList<LocationModel>();

  @observable
  LocationModel location = LocationModel();

  @action
  void setBusy(value) => busy = value;

  @action
  Future fetch() async {
    setBusy(true);
    try {
      final campaignDocuments = await _repository.getDocuments();
      if (campaignDocuments.documents.isNotEmpty) {
        locations = campaignDocuments.documents
            .map((snapshot) => LocationModel.fromMap(snapshot.data))
            .toList()
            .asObservable();
      }
    } catch (e) {
      locations = List<LocationModel>();
    }
    setBusy(false);
  }

  @action
  Future create(LocationModel location) async {
    setBusy(true);
    await _repository.create(location);
    locations.add(location);
    setBusy(false);
  }

  @action
  Future save() async {
    create(location);
  }

  @action
  clearLocations() async {
    locations.clear();
  }

  clearLocation() async {
    location = new LocationModel();
  }
}
