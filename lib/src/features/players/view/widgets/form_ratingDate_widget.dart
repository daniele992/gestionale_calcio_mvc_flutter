import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../providers/ratingDate_provider.dart';
import '../../../../common_widgets/datePicker/DatePickerTextField_DateBirthday.dart';
import '../../../../common_widgets/dropDown/dropDownRating.dart';
import '../../controller/insertPlayers_controller.dart';

class FormRateDateWidget extends ConsumerStatefulWidget {
  const FormRateDateWidget({super.key});

  @override
  ConsumerState<FormRateDateWidget> createState() => _FormRateDateWidget();
}

class _FormRateDateWidget extends ConsumerState<FormRateDateWidget> {

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(InsertPlayersController());
    final selectedValueTechnique = ref.watch(ratingTechniqueProvider);
    final selectedValueIntelligence = ref.watch(ratingIntelligenceProvider);
    final selectedValuePersonality = ref.watch(ratingPersonalityProvider);
    final selectedValueSpeed = ref.watch(ratingSpeedProvider);
    final selectedValueStructure = ref.watch(ratingStructureProvider);
    final totalTipss = ref.watch(totalRating);
    final List<double> values = List.generate(21, (i) => i * 0.5); //da 0.0 a 10.0

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePickerTextField(dateProvider: dateObservationProvider),
                    SizedBox(height: 12),

                    //Dropdown rating Technique
                    DropdownRating(
                      selectedValue: selectedValueTechnique,
                      values: values,
                      onChanged: (newValue) {
                        ref.read(ratingTechniqueProvider.notifier).state = newValue;
                      },
                      label: tTechnique,
                      hintText: tHintRating,
                      icon: Icons.sports_soccer,
                      textDialog: tListTechnique
                    ),
                    SizedBox(height: 12),

                    //Dropdown rating Intelligence
                    DropdownRating(
                      selectedValue: selectedValueIntelligence,
                      values: values,
                      onChanged: (newValue) {
                        ref.read(ratingIntelligenceProvider.notifier).state = newValue;
                      },
                      label: tIntelligence,
                      hintText: tHintRating,
                      icon: Icons.lightbulb,
                      textDialog: tListIntelligence
                    ),
                    SizedBox(height: 12),

                    //Dropdown rating Personality
                    DropdownRating(
                      selectedValue: selectedValuePersonality,
                      values: values,
                      onChanged: (newValue) {
                        ref.read(ratingPersonalityProvider.notifier).state = newValue;
                      },
                      label: tPersonality,
                      hintText: tHintRating,
                      icon: Icons.psychology,
                      textDialog: tListPersonality,
                    ),
                    SizedBox(height: 12),

                    //Dropdown rating Speed
                    DropdownRating(
                      selectedValue: selectedValueSpeed,
                      values: values,
                      onChanged: (newValue) {
                        ref.read(ratingSpeedProvider.notifier).state = newValue;
                      },
                      label: tSpeed,
                      hintText: tHintRating,
                      icon: Icons.directions_run,
                      textDialog: tListSpeed,
                    ),
                    SizedBox(height: 12),

                    //Dropdown rating Structure
                    DropdownRating(
                      selectedValue: selectedValueStructure,
                      values: values,
                      onChanged: (newValue) {
                        ref.read(ratingStructureProvider.notifier).state = newValue;
                      },
                      label: tStructure,
                      hintText: tHintRating,
                      icon: Icons.fitness_center,
                      textDialog: tListStructure,
                    ),
                    SizedBox(height: 12),

                    //TextFormField for comment
                    TextFormField(
                      controller: controller.comment,
                      decoration: InputDecoration(
                        labelText: 'Inserisci commento',
                        contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),

                    //TextFormField for total Tipss
                    TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: tTotalTipss,
                        enabledBorder: OutlineInputBorder(),
                        prefixIcon: Icon(LineAwesomeIcons.star),
                      ),
                      controller: TextEditingController(
                        text: ref.watch(totalRating).toStringAsFixed(1),
                      ),
                    ),
                    SizedBox(height: 6),

                    //Color value Tipss
                    (totalTipss > 0.0)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 16,
                              width: double.infinity,
                              color: getColorByValue(totalTipss),
                            ),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              )),
        ),
      ],
    );
  }

  getColorByValue(double value) {
    if (value <= 27.5) return Colors.red;
    if (value >= 28 && value <= 30) return Colors.amberAccent;
    if (value >= 30.5 && value <= 32.5) return Colors.orange;
    if (value >= 33 && value <= 36.5) return Colors.deepPurpleAccent;
    if (value >= 37) return Colors.deepPurple;
  }
}
