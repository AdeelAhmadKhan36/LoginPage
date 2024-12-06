import 'package:flutter/material.dart';
import 'package:hifah_tech_task/resources/exceptions/exception.dart';

class LoginViewModel with ChangeNotifier {
  String? _phoneNumber;
  String? _password;
  String? _selectedCountryCode = '+92';

  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
  String? get selectedCountryCode => _selectedCountryCode;

  void updatePhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void updateCountryCode(String value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  Future<void> login() async {
    try {
      if (_phoneNumber == null || _phoneNumber!.isEmpty) {
        throw ValidationException("Phone number is required.");
      }
      if (_password == null || _password!.isEmpty) {
        throw ValidationException("Password is required.");
      }

      // Perform login using repository (dummy API call here)
      await Future.delayed(Duration(seconds: 2));
      // On success, notify listeners
    } catch (e) {
      rethrow;
    }
  }
}
