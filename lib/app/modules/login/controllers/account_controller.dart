import 'package:mobx/mobx.dart';
import 'package:my_blood/app/modules/login/repositories/account_repository.dart';

part 'account_controller.g.dart';

class AccountController = _AccountControllerBase with _$AccountController;

abstract class _AccountControllerBase with Store {
  AccountRepository _repository;

  _AccountControllerBase() {
    _repository = new AccountRepository();
  }

  @observable
  bool busy = false;

  @observable
  String userEmail = '';

  @observable
  String userPassword = '';

  @action
  void setBusy(bool value) => busy = value;

  @action
  void setEmail(String value) => userEmail = value;

  @action
  void setPassword(String value) => userPassword = value;

  @action
  Future signInWithCredentials({Function onSuccess, Function(String) onError}) async {
    setBusy(true);
    _repository
        .signInWithCredentials(userEmail, userPassword)
        .then((value) => onSuccess())
        .catchError(onError)
        .whenComplete(() => setBusy(false));
  }

  @action
  Future loginWithGoogle() async {}

  @action
  Future register() async {}

  @action
  Future logout() async {}
}
