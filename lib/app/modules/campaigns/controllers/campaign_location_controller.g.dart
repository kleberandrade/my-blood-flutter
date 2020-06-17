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

  final _$campaignAtom = Atom(name: '_CampaignLocationControllerBase.campaign');

  @override
  CampaignLocationModel get campaign {
    _$campaignAtom.reportRead();
    return super.campaign;
  }

  @override
  set campaign(CampaignLocationModel value) {
    _$campaignAtom.reportWrite(value, super.campaign, () {
      super.campaign = value;
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

  final _$createAsyncAction =
      AsyncAction('_CampaignLocationControllerBase.create');

  @override
  Future<dynamic> create(CampaignLocationModel campaign) {
    return _$createAsyncAction.run(() => super.create(campaign));
  }

  final _$saveAsyncAction = AsyncAction('_CampaignLocationControllerBase.save');

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$clearLocationsAsyncAction =
      AsyncAction('_CampaignLocationControllerBase.clearLocations');

  @override
  Future clearLocations() {
    return _$clearLocationsAsyncAction.run(() => super.clearLocations());
  }

  final _$clearLocationAsyncAction =
      AsyncAction('_CampaignLocationControllerBase.clearLocation');

  @override
  Future clearLocation() {
    return _$clearLocationAsyncAction.run(() => super.clearLocation());
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
  void setPicture(String pictureUrl) {
    final _$actionInfo = _$_CampaignLocationControllerBaseActionController
        .startAction(name: '_CampaignLocationControllerBase.setPicture');
    try {
      return super.setPicture(pictureUrl);
    } finally {
      _$_CampaignLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
campaign: ${campaign},
campaigns: ${campaigns}
    ''';
  }
}
