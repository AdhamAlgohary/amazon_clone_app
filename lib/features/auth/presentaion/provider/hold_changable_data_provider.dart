import 'package:flutter/material.dart';

import 'package:amazon_clone_app/core/strings/app_strings.dart';

class HoldChangableDataProvider with ChangeNotifier {
  String _selectedSignInOrSignUp = AppStrings.createAccountTxt;
  void selectSignUpOrSignInRadioButton(String value) {
    _selectedSignInOrSignUp = value;
    notifyListeners();
  }



  String get selectedSignInOrSignUp => _selectedSignInOrSignUp;
}
