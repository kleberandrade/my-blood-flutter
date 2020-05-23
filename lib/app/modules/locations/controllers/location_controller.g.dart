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

  final _$fetchAsyncAction = AsyncAction('_LocationControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$addAsyncAction = AsyncAction('_LocationControllerBase.add');

  @override
  Future add(LocationModel campaign) {
    return _$addAsyncAction.run(() => super.add(campaign));
  }

  final _$clearAsyncAction = AsyncAction('_LocationControllerBase.clear');

  @override
  Future clear() {
    return _$clearAsyncAction.run(() => super.clear());
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
locations: ${locations}
    ''';
  }
}
