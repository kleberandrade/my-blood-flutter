// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaqController on _FaqControllerBase, Store {
  final _$busyAtom = Atom(name: '_FaqControllerBase.busy');

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

  final _$faqListAtom = Atom(name: '_FaqControllerBase.faqList');

  @override
  ObservableList<FaqModel> get faqList {
    _$faqListAtom.reportRead();
    return super.faqList;
  }

  @override
  set faqList(ObservableList<FaqModel> value) {
    _$faqListAtom.reportWrite(value, super.faqList, () {
      super.faqList = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_FaqControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$addAsyncAction = AsyncAction('_FaqControllerBase.add');

  @override
  Future add(FaqModel faq) {
    return _$addAsyncAction.run(() => super.add(faq));
  }

  final _$clearAsyncAction = AsyncAction('_FaqControllerBase.clear');

  @override
  Future clear() {
    return _$clearAsyncAction.run(() => super.clear());
  }

  final _$_FaqControllerBaseActionController =
      ActionController(name: '_FaqControllerBase');

  @override
  void setBusy(dynamic value) {
    final _$actionInfo = _$_FaqControllerBaseActionController.startAction(
        name: '_FaqControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_FaqControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
faqList: ${faqList}
    ''';
  }
}
