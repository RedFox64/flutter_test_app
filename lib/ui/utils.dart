import 'package:flutter/material.dart';
import 'package:test_app/api/models/character_gender.dart';

class UIutils {
  static IconData displayGender(CharacterGender gender) {
    switch (gender) {
      case CharacterGender.male:
        return Icons.male;
      case CharacterGender.female:
        return Icons.female;
      default:
        return Icons.report_problem;
    }
  }
}
