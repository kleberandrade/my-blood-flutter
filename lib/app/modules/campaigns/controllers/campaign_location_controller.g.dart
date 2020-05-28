// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CampaignLocationController on _CampaignLocationControllerBase, Store {
  final _$busyAtom = Atom(name: '_CampaignLocationControllerBase.busy');

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

  final _$campaignsAtom =
      Atom(name: '_CampaignLocationControllerBase.campaigns');

  @override
  ObservableList<CampaignLocationModel> get campaigns {
    _$campaignsAtom.reportRead();
    return super.campaigns;
  }

  @override
  set campaigns(ObservableList<CampaignLocationModel> value) {
    _$campaignsAtom.reportWrite(value, super.campaigns, () {
      super.campaigns = value;
    });
  }

  final _$fetchAsyncAction =
      AsyncAction('_CampaignLocationControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$addAsyncAction = AsyncAction('_CampaignLocationControllerBase.add');

  @override
  Future add(CampaignLocationModel campaign) {
    return _$addAsyncAction.run(() => super.add(campaign));
  }

  final _$clearAsyncAction =
      AsyncAction('_CampaignLocationControllerBase.clear');

  @override
  Future clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$_CampaignLocationControllerBaseActionController =
      ActionController(name: '_CampaignLocationControllerBase');

  @override
  void setBusy(dynamic value) {
    final _$actionInfo = _$_CampaignLocationControllerBaseActionController
        .startAction(name: '_CampaignLocationControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_CampaignLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
campaigns: ${campaigns}
    ''';
  }
}
