import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../providers/physicalDate_provider.dart';
import '../../../../common_widgets/dropDown/dropdownBiotype.dart';
import '../../../../common_widgets/dropDown/dropdownSomatotype.dart';
import '../../../../common_widgets/dropDown/dropdownBuild.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';
import '../../controller/insertPlayers_controller.dart';

class FormPhysicalDateWidget extends ConsumerStatefulWidget {
  const FormPhysicalDateWidget({super.key});

  @override
  ConsumerState<FormPhysicalDateWidget> createState() => _FormPhysicalDateWidget();
}

class _FormPhysicalDateWidget extends ConsumerState<FormPhysicalDateWidget> {

  @override
  Widget build(BuildContext context) {
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
                //TextFormField for Height
                TextFormField(
                  validator: Helper.validateHeightOrWeight,
                  initialValue: ref.watch(heightPlayerProvider),
                  onChanged: (value) => ref.read(heightPlayerProvider.notifier).state = value,
                  decoration: const InputDecoration(
                      labelText: tHeight,
                      prefixIcon: Icon(Icons.straighten),
                      hintText: tHintHeight),
                ),

                SizedBox(height: 12),

                //TextFormField for Weight
                TextFormField(
                  validator: Helper.validateHeightOrWeight,
                  initialValue: ref.watch(weightPlayerProvider),
                  onChanged: (value) => ref.read(weightPlayerProvider.notifier).state = value,
                  decoration: const InputDecoration(
                    labelText: tWeight,
                    prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                    hintText: tHintWeight,
                  ),
                ),

                SizedBox(height: 12),

                //DropDown for Somatotype
                SomatotypeDropDown(),

                SizedBox(height: 12),

                //TextFormField for BioType
                BiotypeDropDown(),

                SizedBox(height: 12),

                //Structure
                BuildDropDown(),

                SizedBox(height: 12),

                //TextFormField for  Preferred Foot
                TextFormField(
                  validator: Helper.validateNameSurnameFoot,
                  initialValue: ref.watch(preferredFootProvider),
                  onChanged: (value) => ref.read(preferredFootProvider.notifier).state = value,
                  decoration: const InputDecoration(
                      labelText: tFavoriteFoot,
                      prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                      hintText: tHintFavoriteFoot
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



