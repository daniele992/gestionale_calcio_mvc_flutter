import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InsertPlayersController extends GetxController {
  static InsertPlayersController get instance => Get.find();

  final name = TextEditingController();
  GlobalKey<FormState> playersFormKey = GlobalKey<FormState>();



}