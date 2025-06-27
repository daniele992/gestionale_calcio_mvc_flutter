import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';
import '../../controller/insertPlayers_controller.dart';

class FormPhysicalDateWidget extends ConsumerStatefulWidget {
  const FormPhysicalDateWidget({super.key});

  @override
  ConsumerState<FormPhysicalDateWidget> createState() =>
      _FormPhysicalDateWidget();
}

class _FormPhysicalDateWidget extends ConsumerState<FormPhysicalDateWidget> {

  final List<String> preferredFoot = ['Right', 'Left', 'Ambidextrous'];


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
            width:MediaQuery.of(context).size.width * 0.75, // 60% height
            height: MediaQuery.of(context).size.height * 0.65, // 60% height
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //TextFormField for Height
                TextFormField(
                  validator: Helper.validateHeightOrWeight,
                  controller: controller.height,
                  decoration: const InputDecoration(
                      labelText: tHeight,
                      prefixIcon: Icon(Icons.straighten),
                      hintText: tHintHeight),
                ),

                SizedBox(height: 12),

                //TextFormField for Weight
                TextFormField(
                  validator: Helper.validateHeightOrWeight,
                  controller: controller.weight,
                  decoration: const InputDecoration(
                    labelText: tWeight,
                    prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                    hintText: tHintWeight,
                  ),
                ),

                SizedBox(height: 12),

                //DropDown for Somatotype
                Obx(
                      () => DropdownButtonFormField<String>(
                    items: preferredFoot.map((foot){
                      return DropdownMenuItem(
                        value: foot,
                        child: Text(foot),
                      );
                    }).toList(),
                    onChanged: controller.preferredFoot,
                    value: controller.preferredFoot.value,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Seleziona un\'opzione valida';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Seleziona un\'opzione',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                //TextFormField for BioType
                Obx(
                      () => DropdownButtonFormField<String>(
                    items: preferredFoot.map((foot){
                      return DropdownMenuItem(
                        value: foot,
                        child: Text(foot),
                      );
                    }).toList(),
                    onChanged: controller.preferredFoot,
                    value: controller.preferredFoot.value,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Seleziona un\'opzione valida';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Seleziona un\'opzione',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                //TextFormField for  Preferred Foot
                Obx(
                    () => DropdownButtonFormField<String>(
                      items: preferredFoot.map((foot){
                        return DropdownMenuItem(
                          value: foot,
                          child: Text(foot),
                        );
                      }).toList(),
                      onChanged: controller.preferredFoot,
                      value: controller.preferredFoot.value,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Seleziona un\'opzione valida';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Seleziona un\'opzione',
                        border: OutlineInputBorder(),
                      ),

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
