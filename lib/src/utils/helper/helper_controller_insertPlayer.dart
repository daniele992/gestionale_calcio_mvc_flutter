import 'package:bad_words/bad_words.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../constants/text_strings.dart';

class HelperPlayer extends GetxController {

  static String? validateNameAndSurname(value){
    final filter = Filter();
    if (value == null || value.isEmpty) return tNamePlayerCannotEmpty;
    if(filter.isProfane(value)) return tNamePlayerCannotEmpty;
    //if(!GetUtils.isEmail(value)) return tInvalidEmailFormat;
    return null;

  }

  static String? validateTeam(value) {
    final filter = Filter();
    if(value == null || value.isEmpty) return tNameTeamCannotEmpty;
    if(filter.isProfane(value)) return tNameTeamCannotEmpty;

    return null;
  }



}