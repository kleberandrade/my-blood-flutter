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
  String userName = "";

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
  void setName(String value) => userName = value;

  @action
  Future signInWithCredentials(
      {Function onSuccess, Function(String) onError}) async {
    setBusy(true);
    _repository
        .signInWithCredentials(email: userEmail, password: userPassword)
        .then((value) => onSuccess())
        .catchError(onError)
        .whenComplete(() => setBusy(false));
  }

  @action
  Future signUpWithCredentials(
      {Function onSuccess, Function(String) onError}) async {
    setBusy(true);
    _repository
        .createUserWithEmailAndPassword(email: userEmail, password: userPassword, name: userName)
        .then((value) => onSuccess())
        .catchError(onError)
        .whenComplete(() => setBusy(false));
  }

  @action
  Future sendPasswordResetEmail(
      {Function onSuccess, Function(String) onError}) async {
    setBusy(true);
    _repository
        .sendPasswordResetEmail(email: userEmail)
        .then((value) => onSuccess())
        .catchError(onError)
        .whenComplete(() => setBusy(false));
  }
}
