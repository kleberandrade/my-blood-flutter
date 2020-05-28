// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationController on _LocationControllerBase, Store {
  final _$busyAtom = Atom(name: '_LocationControllerBase.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  final _$locationsAtom = Atom(name: '_LocationControllerBase.locations');

  @override
  ObservableList<LocationModel> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(ObservableList<LocationModel> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  final _$locationAtom = Atom(name: '_LocationControllerBase.location');

  @override
  LocationModel get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(LocationModel value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_LocationControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$createAsyncAction = AsyncAction('_LocationControllerBase.create');

  @override
  Future<dynamic> create(LocationModel location) {
    return _$createAsyncAction.run(() => super.create(location));
  }

  final _$saveAsyncAction = AsyncAction('_LocationControllerBase.save');

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$clearLocationsAsyncAction =
      AsyncAction('_LocationControllerBase.clearLocations');

  @override
  Future clearLocations() {
    return _$clearLocationsAsyncAction.run(() => super.clearLocations());
  }

  final _$clearLocationAsyncAction =
      AsyncAction('_LocationControllerBase.clearLocation');

  @override
  Future clearLocation() {
    return _$clearLocationAsyncAction.run(() => super.clearLocation());
  }

  final _$_LocationControllerBaseActionController =
      ActionController(name: '_LocationControllerBase');

  @override
  void setBusy(dynamic value) {
    final _$actionInfo = _$_LocationControllerBaseActionController.startAction(
        name: '_LocationControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_LocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
locations: ${locations},
location: ${location}
    ''';
  }
}
