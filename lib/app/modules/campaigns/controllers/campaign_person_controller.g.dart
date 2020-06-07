// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_person_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CampaignPersonController on _CampaignPersonControllerBase, Store {
  final _$busyAtom = Atom(name: '_CampaignPersonControllerBase.busy');

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

  final _$campaignAtom = Atom(name: '_CampaignPersonControllerBase.campaign');

  @override
  CampaignPersonModel get campaign {
    _$campaignAtom.reportRead();
    return super.campaign;
  }

  @override
  set campaign(CampaignPersonModel value) {
    _$campaignAtom.reportWrite(value, super.campaign, () {
      super.campaign = value;
    });
  }

  final _$campaignsAtom = Atom(name: '_CampaignPersonControllerBase.campaigns');

  @override
  ObservableList<CampaignPersonModel> get campaigns {
    _$campaignsAtom.reportRead();
    return super.campaigns;
  }

  @override
  set campaigns(ObservableList<CampaignPersonModel> value) {
    _$campaignsAtom.reportWrite(value, super.campaigns, () {
      super.campaigns = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_CampaignPersonControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$createAsyncAction =
      AsyncAction('_CampaignPersonControllerBase.create');

  @override
  Future<dynamic> create(CampaignPersonModel campaign) {
    return _$createAsyncAction.run(() => super.create(campaign));
  }

  final _$saveAsyncAction = AsyncAction('_CampaignPersonControllerBase.save');

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$clearLocationsAsyncAction =
      AsyncAction('_CampaignPersonControllerBase.clearLocations');

  @override
  Future clearLocations() {
    return _$clearLocationsAsyncAction.run(() => super.clearLocations());
  }

  final _$clearLocationAsyncAction =
      AsyncAction('_CampaignPersonControllerBase.clearLocation');

  @override
  Future clearLocation() {
    return _$clearLocationAsyncAction.run(() => super.clearLocation());
  }

  final _$_CampaignPersonControllerBaseActionController =
      ActionController(name: '_CampaignPersonControllerBase');

  @override
  void setBusy(dynamic value) {
    final _$actionInfo = _$_CampaignPersonControllerBaseActionController
        .startAction(name: '_CampaignPersonControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_CampaignPersonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPicture(String pictureUrl) {
    final _$actionInfo = _$_CampaignPersonControllerBaseActionController
        .startAction(name: '_CampaignPersonControllerBase.setPicture');
    try {
      return super.setPicture(pictureUrl);
    } finally {
      _$_CampaignPersonControllerBaseActionController.endAction(_$actionInfo);
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
