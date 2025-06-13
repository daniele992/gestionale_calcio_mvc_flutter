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
import '../../models/nationality_model.dart';

// Provider per gestire la nazionalità selezionata
final nationalityProvider = StateProvider<Nationality?>((ref) => null);
final TextEditingController continentController = TextEditingController();

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  const FormPersonalDateWidget({super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() =>
      _FormPersonalDateWidget();
}


class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  bool _isListenerInitialized = false;


  @override
  void initState(){
    super.initState();
    //Inizializzazione di base, ref non può essere usato qui perchè qui non è ancora completamente inizializzato
  }


  @override
  Widget build(BuildContext context) {

    final controller = Get.put(InsertPlayersController());
    final nation = ref.watch(nationSelectedProvider);

    // ✅ Esegui il listener una sola volta
    if (!_isListenerInitialized) {
      _isListenerInitialized = true;

      // Ascolta i cambiamenti della nazione selezionata
      ref.listen<Nationality?>(nationSelectedProvider, (previous, next) {
        continentController.text = next?.continent ?? '';
      });

      // Imposta il valore iniziale
      continentController.text = nation?.continent ?? '';
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
                      labelText: tName,
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail),
                ),

                SizedBox(height: 12),

                ///TextFormField for Surname
                TextFormField(
                  validator: Helper.validateNameAndSurname,
                  controller: controller.surname,
                  decoration: const InputDecoration(
                      labelText: tSurname,
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),

                SizedBox(height: 12),

                ///TextFormField for date of birthday
                DatePickerTextField(
                  controller: controller.dateOfBirthday,
                ),

                SizedBox(height: 12),

                ///TextFormField for Team
                TextFormField(
                  validator: Helper.validateEmail,
                  controller: controller.team,
                  decoration: const InputDecoration(
                      labelText: tTeam,
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
                  controller: continentController,
                  decoration: const InputDecoration(
                      labelText: tContinent,
                      prefixIcon: Icon(LineAwesomeIcons.globe_solid),
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


