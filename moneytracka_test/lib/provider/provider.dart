import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordChecker = StateProvider((ref) => '');
final passwordWeak = StateProvider((ref) => false);
final passwordEightCharacters = StateProvider((ref) => false);
final passwordContainsSymbols = StateProvider((ref) => false);