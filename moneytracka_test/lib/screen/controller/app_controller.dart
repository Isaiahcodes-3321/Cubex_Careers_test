import 'package:flutter/material.dart';
import 'package:moneytracka_test/provider/provider.dart';

// variable holding user password
TextEditingController password = TextEditingController();

class CheckPassword {
  static var refProvider;

// check if the user password contains any of the requirement
  static checkPasswordStrength() {
    final userPassword = refProvider.watch(passwordChecker);
    if (userPassword.toString().length > 7) {
      refProvider.read(passwordEightCharacters.notifier).state = true;
    } else {
      refProvider.read(passwordEightCharacters.notifier).state = false;
    }
    if (userPassword.toString().contains(RegExp(r'[A-Z]')) &&
        userPassword.toString().contains(RegExp(r'[a-z]'))) {
      refProvider.read(passwordWeak.notifier).state = true;
    } else {
      refProvider.read(passwordWeak.notifier).state = false;
    }
    if (userPassword.toString().contains(RegExp(
        r'[!@#$¥%^&*()¢_+{}\[\]:;<>,$€.?~\£\-← ↑ → ↓ ↔ ↕ ↖ ↗ ↘ ↙× ÷ = < > ≤ ≥ ≠ ≈ ± √ ∑ ∫ ∆ π ≡ ∞ ∠]'))) {
      refProvider.read(passwordContainsSymbols.notifier).state = true;
    } else {
      refProvider.read(passwordContainsSymbols.notifier).state = false;
    }
  }
}
