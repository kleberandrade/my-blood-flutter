// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CampaignController on _CampaignControllerBase, Store {
  final _$busyAtom = Atom(name: '_CampaignControllerBase.busy');

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

  final _$campaignsAtom = Atom(name: '_CampaignControllerBase.campaigns');

  @override
  ObservableList<CampaignModel> get campaigns {
    _$campaignsAtom.reportRead();
    return super.campaigns;
  }

  @override
  set campaigns(ObservableList<CampaignModel> value) {
    _$campaignsAtom.reportWrite(value, super.campaigns, () {
      super.campaigns = value;
    });
  }

  final _$getCampaignsAsyncAction =
      AsyncAction('_CampaignControllerBase.getCampaigns');

  @override
  Future<dynamic> getCampaigns() {
    return _$getCampaignsAsyncAction.run(() => super.getCampaigns());
  }

  final _$addAsyncAction = AsyncAction('_CampaignControllerBase.add');

  @override
  Future add(CampaignModel campaign) {
    return _$addAsyncAction.run(() => super.add(campaign));
  }

  final _$clearAsyncAction = AsyncAction('_CampaignControllerBase.clear');

  @override
  Future clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$_CampaignControllerBaseActionController =
      ActionController(name: '_CampaignControllerBase');

  @override
  void setBusy(dynamic value) {
    final _$actionInfo = _$_CampaignControllerBaseActionController.startAction(
        name: '_CampaignControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_CampaignControllerBaseActionController.endAction(_$actionInfo);
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
