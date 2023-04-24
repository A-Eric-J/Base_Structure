import 'package:base_structure_project/enums/gender_state.dart';

/// [User] model is so common and you can add or remove its data members
class User {
  String? id;
  String? fName;
  String? lName;
  String? phoneNumber;
  String? email;
  GenderState? gender;
  int? balance;
  String? birthDate;

  User({this.fName, this.lName, this.balance});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    fName = json['firstname'] ?? '';
    lName = json['lastname'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    email = json['email'] ?? '';
    if (json['gender'] != null) {
      switch (json['gender']) {
        case 'Male':
          gender = GenderState.male;
          break;
        case 'Female':
          gender = GenderState.female;
          break;
      }
    } else {
      gender = GenderState.notRatherToSay;
    }
    balance = json['balance'] ?? 0;
    birthDate = json['birthdate'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = fName;
    data['lastname'] = lName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender.toString().split('.').last;
    data['balance'] = balance;
    data['birthdate'] = birthDate;
    return data;
  }
}
