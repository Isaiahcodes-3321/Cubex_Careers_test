import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordChecker = StateProvider((ref) => '');
final uppercasePassword = StateProvider((ref) => false);
final passwordEightCharacters = StateProvider((ref) => false);
final passwordContainsSymbols = StateProvider((ref) => false);
