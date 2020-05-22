// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountController on _AccountControllerBase, Store {
  final _$busyAtom = Atom(name: '_AccountControllerBase.busy');

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

  final _$userEmailAtom = Atom(name: '_AccountControllerBase.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$userPasswordAtom = Atom(name: '_AccountControllerBase.userPassword');

  @override
  String get userPassword {
    _$userPasswordAtom.reportRead();
    return super.userPassword;
  }

  @override
  set userPassword(String value) {
    _$userPasswordAtom.reportWrite(value, super.userPassword, () {
      super.userPassword = value;
    });
  }

  final _$signInWithCredentialsAsyncAction =
      AsyncAction('_AccountControllerBase.signInWithCredentials');

  @override
  Future<dynamic> signInWithCredentials(
      {Function onSuccess, dynamic Function(String) onError}) {
    return _$signInWithCredentialsAsyncAction.run(() =>
        super.signInWithCredentials(onSuccess: onSuccess, onError: onError));
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AccountControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$registerAsyncAction = AsyncAction('_AccountControllerBase.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$logoutAsyncAction = AsyncAction('_AccountControllerBase.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AccountControllerBaseActionController =
      ActionController(name: '_AccountControllerBase');

  @override
  void setBusy(bool value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setBusy');
    try {
      return super.setBusy(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AccountControllerBaseActionController.startAction(
        name: '_AccountControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busy: ${busy},
userEmail: ${userEmail},
userPassword: ${userPassword}
    ''';
  }
}
