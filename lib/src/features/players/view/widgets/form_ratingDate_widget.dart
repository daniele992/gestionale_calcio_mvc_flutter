import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../providers/rating_provider.dart';
import '../../../../common_widgets/datePicker/DatePickerTextField_DateBirthday.dart';
import '../../../../common_widgets/dropDown/dropDownRating.dart';
import '../../controller/insertPlayers_controller.dart';

class FormRateDateWidget extends ConsumerStatefulWidget {
  const FormRateDateWidget({super.key});

  @override
  ConsumerState<FormRateDateWidget> createState() => _FormRateDateWidget();
}

class _FormRateDateWidget extends ConsumerState<FormRateDateWidget> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(InsertPlayersController());
    final selectedValueTechnique = ref.watch(ratingTechnique);
    final selectedValueIntelligence = ref.watch(ratingIntelligence);
    final selectedValuePersonality = ref.watch(ratingPersonality);
    final selectedValueSpeed = ref.watch(ratingSpeed);
    final selectedValueStructure = ref.watch(ratingStructure);
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
                  DatePickerTextField(controller: controller.dateObservation),

                  SizedBox(height: 12),

                  //Dropdown rating Technique
                  DropdownRating(
                    selectedValue: selectedValueTechnique,
                    values: values,
                    onChanged: (newValue) {
                      ref.read(ratingTechnique.notifier).state = newValue;
                    },
                    label: tTechnique,
                    hintText: tHintRating,
                  ),

                  SizedBox(height: 12),

                  //Dropdown rating Intelligence
                  DropdownRating(
                    selectedValue: selectedValueIntelligence,
                    values: values,
                    onChanged: (newValue) {
                      ref.read(ratingIntelligence.notifier).state = newValue;
                    },
                    label: tIntelligence,
                    hintText: tHintRating,
                  ),
                  SizedBox(height: 12),

                  //Dropdown rating Personality
                  DropdownRating(
                    selectedValue: selectedValuePersonality,
                    values: values,
                    onChanged: (newValue) {
                      ref.read(ratingPersonality.notifier).state = newValue;
                    },
                    label: tPersonality,
                    hintText: tHintRating,
                  ),
                  SizedBox(height: 12),

                  //Dropdown rating Speed
                  DropdownRating(
                    selectedValue: selectedValueSpeed,
                    values: values,
                    onChanged: (newValue) {
                      ref.read(ratingSpeed.notifier).state = newValue;
                    },
                    label: tSpeed,
                    hintText: tHintRating,
                  ),
                  SizedBox(height: 12),

                  //Dropdown rating Structure
                  DropdownRating(
                    selectedValue: selectedValueStructure,
                    values: values,
                    onChanged: (newValue) {
                      ref.read(ratingStructure.notifier).state = newValue;
                    },
                    label: tStructure,
                    hintText: tHintRating,
                  ),
                  SizedBox(height: 12),

                  //TextFormField for total Tipss
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: tTotalTipss,
                      prefixIcon: Icon(LineAwesomeIcons.star),
                    ),
                    controller: TextEditingController(
                      text: ref.watch(totalRating).toStringAsFixed(1),
                    ) ,
                  ),
                  SizedBox(height: 12),


                ],
              ),
            )
          ),
        ),
      ],
    );
  }
}
