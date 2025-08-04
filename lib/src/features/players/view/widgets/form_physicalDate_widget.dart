import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../providers/physicalDate_provider.dart';
import '../../../../common_widgets/dropDown/dropdownBiotype.dart';
import '../../../../common_widgets/dropDown/dropdownSomatotype.dart';
import '../../../../common_widgets/dropDown/dropdownBuild.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';

class FormPhysicalDateWidget extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormPhysicalDateWidget({super.key, required this.formKey});

  @override
  ConsumerState<FormPhysicalDateWidget> createState() => _FormPhysicalDateWidget();
}

class _FormPhysicalDateWidget extends ConsumerState<FormPhysicalDateWidget> {
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late final TextEditingController _footController;

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController(text: ref.read(heightPlayerProvider));
    _weightController = TextEditingController(text: ref.read(weightPlayerProvider));
    _footController = TextEditingController(text: ref.read(preferredFootProvider));
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _footController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Stack(
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
                      validator: (value) => Helper.validateHeightOrWeight(value, field: 'Altezza'),
                      controller: _heightController,
                      onChanged: (value) => ref.read(heightPlayerProvider.notifier).state = value,
                      decoration: const InputDecoration(
                          labelText: tHeight,
                          prefixIcon: Icon(Icons.straighten),
                          hintText: tHeight),
                    ),

                    SizedBox(height: 12),

                    //TextFormField for Weight
                    TextFormField(
                      validator: (value) => Helper.validateHeightOrWeight(value, field: 'Peso'),
                      controller: _weightController,
                      onChanged: (value) => ref.read(weightPlayerProvider.notifier).state = value,
                      decoration: const InputDecoration(
                        labelText: tWeight,
                        prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                        hintText: tWeight,
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
                      controller: _footController,
                      onChanged: (value) => ref.read(preferredFootProvider.notifier).state = value,
                      decoration: const InputDecoration(
                          labelText: tFavoriteFoot,
                          prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                          hintText: tFavoriteFoot),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
