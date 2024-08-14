import 'package:flutter/material.dart';

import 'package:amazon_clone_app/core/strings/app_strings.dart';

class HoldChangableDataProvider with ChangeNotifier {
  String _selectedSignInOrSignUp = AppStrings.authPageCreateAccountTxt;
  bool _selectedShowPasswordOrNot = false;
  void selectSignUpOrSignInRadioButton(String value) {
    _selectedSignInOrSignUp = value;
    notifyListeners();
  }

  void selectedShowPasswordOrNotCheckBoxClick(bool value) {
    _selectedShowPasswordOrNot = value;
    notifyListeners();
  }

  String get selectedSignInOrSignUp => _selectedSignInOrSignUp;
  bool get selectedShowPasswordOrNot => _selectedShowPasswordOrNot;
}
