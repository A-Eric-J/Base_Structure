import 'package:base_structure_project/enums/gender_state.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/models/user.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/ui/shared/regex.dart';
import 'package:base_structure_project/ui/widgets/masked_text_controller.dart';
import 'package:flutter/material.dart';

/// Here is [ProfileProvider] that is designed for profile screen.
/// in profile screen we may have editing profile part(completely it depends on your project) and etc
/// you can add or remove what ever you want as your needs

class ProfileProvider extends ChangeNotifier {
  ViewState _userViewState = ViewState.preparing;

  ViewState get userViewState => _userViewState;

  void setUserViewState(ViewState newState) {
    _userViewState = newState;
    notifyListeners();
  }

  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    _user = null;
  }

  String? _heroImage;

  String? get heroImage => _heroImage ?? SharedPreference.getHeroImage();

  void setHeroImage(String heroImage) {
    SharedPreference.setHeroImage(heroImage);
    _heroImage = heroImage;
    notifyListeners();
  }

  ///Editing information
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneNumberController;

  TextEditingController? get firstNameController => _firstNameController;

  TextEditingController? get lastNameController => _lastNameController;

  TextEditingController? get emailController => _emailController;

  TextEditingController? get phoneNumberController => _phoneNumberController;

  void editingInformationInitialize() {
    _firstNameController = MaskedTextController(mask: '*', length: 30);
    _lastNameController = MaskedTextController(mask: '*', length: 30);
    _phoneNumberController = MaskedTextController(mask: '0', length: 11);
    _emailController = TextEditingController();
  }

  void editingInformationDispose() {
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _emailController!.dispose();
    _phoneNumberController!.dispose();
  }

  GenderState _selectedGender = GenderState.notRatherToSay;

  GenderState get selectedGender => _selectedGender;

  void setSelectedGender(GenderState gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  String _selectedBirthDate = '';

  String get selectedBirthDate => _selectedBirthDate;

  void setSelectedBirthDate(String birthDate) {
    _selectedBirthDate = birthDate;
    notifyListeners();
  }

  bool _validationSuccess = false;

  bool checkingFieldsValidationInEditingInformation() {
    if (_firstNameController!.text.isEmpty ||
        _lastNameController!.text.isEmpty) {
      _validationSuccess = false;
    } else {
      _validationSuccess = true;
    }
    if (_phoneNumberController!.text.isEmpty ||
        _phoneNumberController!.text.length < 11) {
      _validationSuccess = false;
    } else {
      _validationSuccess = true;
    }
    if (_emailController!.text.isEmpty ||
        !emailCharactersRegExp.hasMatch(_emailController!.text)) {
      _validationSuccess = false;
    } else {
      _validationSuccess = true;
    }

    notifyListeners();
    return _validationSuccess;
  }
}
