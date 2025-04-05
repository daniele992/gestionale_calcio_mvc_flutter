import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordsUtils {

  ///Generate Random Password
  static String generatePassword(int length, {String requiredChars = '', String allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#\$%^&*'}) {

    Random random = Random();
    List<String> password = [];

    //Adds required characters
    password.addAll(requiredChars.split(''));

    //Adds the remaining characters randomly
    for (int i = password.length; i < length; i++) {
      password.add(allowedChars[random.nextInt(allowedChars.length)]);
    }

    //Mix up your password so that you don't always have mandatory characters at the beginning
    password.shuffle();

    //convert a list of strings into a single string.
    return password.join();
  }

  String generateStrongPassword(int length) {
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


  ///Generate random UpperCase Letter
  static String getRandomUpperCaseLetter(){
    const String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random random = Random();
    return letters[random.nextInt(letters.length)];
  }


  ///Generate random Special Character
  static String getRandomSpecialCharacter(){
    const String specialChars = "!@#\$%^&*()_-+=<>?/{}[]|";
    Random random = Random();
    return specialChars[random.nextInt(specialChars.length)];
  }


  ///Generate random number between set value
  static int getRandomNumberBetween(int min, int max){
    Random random = Random();
    return min + random.nextInt(max - min + 1);
  }

  ///Function to know if a UPPERCASE LETTER is present in the password
  static bool hasUppercase(String password) => password.contains(RegExp(r'[A-Z]'));

  ///Function to know if a NUMBER is present in the password
  static bool hasNumber(String password) => password.contains(RegExp(r'[0-9]'));

  ///Function to know if a SPECIAL CHAR is present in the password
  static bool hasSpecialChar(String password) => password.contains(RegExp(r'[!@#\$&*~]'));

  ///Function to know if the length is respected in the password
  static bool hasMinLength(String password, [int minLength = 8]) => password.length >= minLength;


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

  ///Calculate the strength password
  static double calculateStrengthPassword(String password){
    double strength = 0;
    if (hasMinLength(password)) strength += 0.20;
    if (hasUppercase(password)) strength += 0.20;
    if (hasNumber(password)) strength += 0.20;
    if (hasSpecialChar(password)) strength += 0.20;
    if (countUpperCaseLetter(password) >= 2) strength += 0.10;
    if (countSpecialChar(password) >= 2) strength += 10;

    switch(strength) {
      case 0:
      case 1:
        return "Debole";
      case 2:
        return "Media";
      case 3:
        return "Forte";
      case 4:
        return "Molto Forte";
      default:
        return "Non valutabile";
    }


    return strength.clamp(0, 1);

  }

static Map<String, dynamic> calculateStrengthsPassword(String password){
    int score = 0;
    if(password.length >= 8) score ++;
    if(password.contains(RegExp(r'[A-Z]'))) score ++;
    if(password.contains(RegExp(r'[0-9]'))) score ++;
    if (password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) score++;

    if(score <= 1) {
      return {
        'label': 'Debole',
        'color': Colors.red,
        'percent': 0.33,
      };
    }

    if(score <= 1) {
      return {
        'label': 'Debole',
        'color': Colors.red,
        'percent': 0.33,
      };
    }

    if(score <= 1) {
      return {
        'label': 'Debole',
        'color': Colors.red,
        'percent': 0.66,
      };
    }

    if(score <= 1) {
      return {
        'label': 'Debole',
        'color': Colors.red,
        'percent': 1.0,
      };
    }
}


}