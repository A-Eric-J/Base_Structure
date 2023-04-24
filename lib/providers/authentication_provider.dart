import 'dart:async';

import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/ui/widgets/masked_text_controller.dart';
import 'package:flutter/material.dart';


/// Here is [AuthenticationLoginProvider] that is designed for login and register screen. you can add or remove what ever you want
class AuthenticationLoginProvider extends ChangeNotifier {

  String _phoneNumber = '';
  ViewState _loginState = ViewState.preparing;

  bool _registered = false;
  int _verificationId = 0;

  String get phoneNumber => _phoneNumber;


  bool get registered => _registered;

  void setPhoneNumber(String phoneNum) {
    _phoneNumber = phoneNum;
    notifyListeners();
  }

  void setRegistered(String registered) {
    switch (registered) {
      case 'true':
        _registered = true;
        break;
      case 'false':
        _registered = false;
        break;
    }
  }

  void setLoginState(ViewState state){
    _loginState = state;
    notifyListeners();
  }

  void setVerificationId (int id){
    _verificationId = id;
    notifyListeners();
  }

  int get verificationId => _verificationId;

  ViewState get loginState => _loginState;
  ViewState _codeReceiveScreenState = ViewState.preparing;

  ViewState get codeReceiveScreenState => _codeReceiveScreenState;

  void setCodeReceiveScreenState(ViewState newState) {
    _codeReceiveScreenState = newState;
    notifyListeners();
  }

  TextEditingController? _firstVerifiedCodeTextController;

  TextEditingController? _secondVerifiedCodeTextController;
  TextEditingController? _thirdVerifiedCodeTextController;

  TextEditingController? _forthVerifiedCodeTextController;


  TextEditingController? get firstVerifiedCodeTextController => _firstVerifiedCodeTextController;

  TextEditingController? get secondVerifiedCodeTextController => _secondVerifiedCodeTextController;

  TextEditingController? get thirdVerifiedCodeTextController => _thirdVerifiedCodeTextController;

  TextEditingController? get forthVerifiedCodeTextController => _forthVerifiedCodeTextController;

  bool error = false;
  Timer? _timer;
  int _start = 120;

  int get secondsCount => _start;


  void initializeCodeReceive() {
    _firstVerifiedCodeTextController = MaskedTextController(mask: '0');
    _secondVerifiedCodeTextController = MaskedTextController(mask: '0');
    _thirdVerifiedCodeTextController = MaskedTextController(mask: '0');
    _forthVerifiedCodeTextController = MaskedTextController(mask: '0');
  }

  void disposeCodeReceive() {
    _firstVerifiedCodeTextController!.dispose();
    _secondVerifiedCodeTextController!.dispose();
    _thirdVerifiedCodeTextController!.dispose();
    _forthVerifiedCodeTextController!.dispose();
    _timer!.cancel();
  }

  String activationCode() {
    var activationCode = _firstVerifiedCodeTextController!.text +
        _secondVerifiedCodeTextController!.text +
        _thirdVerifiedCodeTextController!.text +
        _forthVerifiedCodeTextController!.text;
    return activationCode;
  }

  void clear() {
    _firstVerifiedCodeTextController!.clear();
    _secondVerifiedCodeTextController!.clear();
    _thirdVerifiedCodeTextController!.clear();
    _forthVerifiedCodeTextController!.clear();
    notifyListeners();
  }

  void startTimer() {
    clear();
    _start = 120;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          _start--;
          notifyListeners();
        }
      },
    );
  }
}