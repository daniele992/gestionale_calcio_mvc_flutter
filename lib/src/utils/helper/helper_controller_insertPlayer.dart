import 'package:bad_words/bad_words.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../constants/text_strings.dart';

///This class helps validate that player and team names are not empty and do not contain inappropriate words. If the validation fails, it returns an error message; otherwise, it indicates everything is fine by returning null.
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