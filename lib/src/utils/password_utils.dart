import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordsUtils {

  static String generateStrongPassword(int length) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()-_=+[]{}|;:,.<>?';
    final allChars = letters + numbers + symbols;
    final rand = Random.secure();

    String getRandom(String chars) =>
        chars[rand.nextInt(chars.length)];

    ///At least one of each type
    String password = '${getRandom(letters)}${getRandom(letters.toUpperCase())}${getRandom(numbers)}${getRandom(symbols)}';
    
    for(int i = 4; i < length; i++) {
      password += getRandom(allChars);
    }
    
    return String.fromCharCodes(password.runes.toList()..shuffle());
  }

  ///Generate random number between set value
  static int getRandomNumberBetween(int min, int max){
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }


  ///Function for count the UpperCase Letter present in the password
  static int countUpperCaseLetter(String password) {
    int countUpperCase = password.runes.map(
        (r) => String.fromCharCode(r))
        .where((c) => c.toUpperCase() == c && c.toLowerCase() != c).length;
    return countUpperCase;
  }


  ///Function for count the Special Char present in the password
  static int countSpecialChar(String password) {
    int countChar = password.split('').where((c) => c.contains(RegExp(r'[A-Z]'))).length;
    return countChar;
  }


  static Map<String, dynamic> calculateStrengthPassword(String password){
    int score = 0;
    if(password.length >= 8) score ++;
    if(password.contains(RegExp(r'[A-Z]'))) score ++;
    if(password.contains(RegExp(r'[0-9]'))) score ++;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) score++;

    if (score <= 1) {
      return {
        'label': 'Weak',
        'color': Colors.red,
        'percent': 0.33,
      };
    } else if (score == 2) {
      return {
        'label': 'Medium',
        'color': Colors.orange,
        'percent': 0.66,
      };
    } else {
      return {
        'label': 'Strong',
        'color': Colors.green,
        'percent': 1.0,
      };
    }

  }

  static void updateStrength(String pwd, Color strengthColor, double strengthPercent, String strengthLabel) {
    final result = PasswordsUtils.calculateStrengthPassword(pwd);
    //setState(() {
      strengthLabel = result['label']!;
      strengthColor = result['color']!;
      strengthPercent = result['percent']!;
      print(result['label']!);
    //});
  }

  /*void generateAndSetPassword(int length) {
    final newPwd = PasswordsUtils.generateStrongPassword(length);
    updateStrength(newPwd);
  } */



}