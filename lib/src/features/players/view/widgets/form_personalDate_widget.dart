import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../providers/nationality_provider.dart';
import '../../../../common_widgets/datePicker/DatePickerTextField_DateBirthday.dart';
import '../../../../common_widgets/dropDown/ DropdownNationsGrouped.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';
import '../../controller/insertPlayers_controller.dart';

// Provider per gestire la nazionalità selezionata
//final nationalityProvider = StateProvider<Nationality?>((ref) => null);
final TextEditingController continentController = TextEditingController();

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  const FormPersonalDateWidget({super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() => _FormPersonalDateWidget();
}

class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  late final TextEditingController continentController;

  @override
  void initState() {
    super.initState();
    continentController = TextEditingController();
  }

  @override
  void dispose() {
    continentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InsertPlayersController());
    final nation = ref.watch(nationSelectedProvider);

    // ✅ Aggiorna il controller nel build
    if (nation != null && continentController.text != nation.continent) {
      continentController.text = nation.continent;
    } else if (nation == null && continentController.text.isNotEmpty) {
      continentController.clear();
    }

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
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.65,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //TextFormField for name player
                TextFormField(
                  validator: Helper.validateNameSurnameFoot,
                  controller: controller.name,
                  decoration: const InputDecoration(
                      labelText: tName,
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail),
                ),

                SizedBox(height: 12),

                //TextFormField for surname player
                TextFormField(
                  validator: Helper.validateNameSurnameFoot,
                  controller: controller.surname,
                  decoration: const InputDecoration(
                      labelText: tSurname,
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail),
                ),

                SizedBox(height: 12),

                //DataPicker for date of birthday
                DatePickerTextField(controller: controller.dateOfBirthday),

                SizedBox(height: 12),

                //TextFormField for team player
                TextFormField(
                  validator: Helper.validateEmail,
                  controller: controller.team,
                  decoration: const InputDecoration(
                      labelText: tTeam,
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tTeam),
                ),

                SizedBox(height: 12),

                //Dropdown for select nation player
                DropdownNationsWithFlags(),

                SizedBox(height: 12),

                //TextFormField for continent
                TextFormField(
                  enabled: false,
                  controller: continentController,
                  decoration: const InputDecoration(
                    labelText: tContinent,
                    prefixIcon: Icon(LineAwesomeIcons.globe_solid),
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

