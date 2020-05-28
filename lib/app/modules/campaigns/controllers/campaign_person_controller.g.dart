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

  final _$addAsyncAction = AsyncAction('_CampaignPersonControllerBase.add');

  @override
  Future add(CampaignPersonModel campaign) {
    return _$addAsyncAction.run(() => super.add(campaign));
  }

  final _$clearAsyncAction = AsyncAction('_CampaignPersonControllerBase.clear');

  @override
  Future clear() {
    return _$clearAsyncAction.run(() => super.clear());
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
  String toString() {
    return '''
busy: ${busy},
campaigns: ${campaigns}
    ''';
  }
}
