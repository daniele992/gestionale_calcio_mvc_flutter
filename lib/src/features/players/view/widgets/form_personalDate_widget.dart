import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../providers/nationality_provider.dart';
import '../../../../common_widgets/dropDown/ DropdownNationsGrouped.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';
import '../../../authentication/controllers/login_controller.dart';
import '../../controller/insertPlayers_controller.dart';

// Provider per gestire la nazionalità selezionata
final nationalityProvider = StateProvider<String?>((ref) => null);

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  const FormPersonalDateWidget({super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() =>
      _FormPersonalDateWidget();
}

class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  @override
  Widget build(BuildContext context) {

    final nation = ref.watch(nationSelectedProvider);
    final controller = Get.put(InsertPlayersController());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75, // 60% height
            height: MediaQuery.of(context).size.height * 0.65, // 60% height
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///TextFormField for Name
                TextFormField(
                  validator: Helper.validateNameAndSurname,
                  controller: controller.name,
                  decoration: const InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail),
                ),

                SizedBox(height: 12),

                ///TextFormField for Surname
                TextFormField(
                  validator: Helper.validateNameAndSurname,
                  //controller: ,
                  decoration: const InputDecoration(
                      labelText: 'Cognome',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),

                SizedBox(height: 12),

                ///TextFormField for date of birthday
                TextFormField(
                  validator: Helper.validateEmail,
                  //controller: ,
                  decoration: const InputDecoration(
                      labelText: 'Data di nascita',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),

                SizedBox(height: 12),

                ///TextFormField for Team
                TextFormField(
                  validator: Helper.validateEmail,
                  //controller: ,
                  decoration: const InputDecoration(
                      labelText: 'Squadra',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),

                SizedBox(height: 12),

                ///Dropdown for Nationality
                DropdownNationsWithFlags(),

                SizedBox(height: 12),

                ///TextFormField for Continent
                TextFormField(
                  enabled: false,
                  controller: TextEditingController(
                    text: nation?.continent ?? '',
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Continente',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
