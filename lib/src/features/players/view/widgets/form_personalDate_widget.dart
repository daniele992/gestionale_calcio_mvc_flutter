import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../providers/personalDate_provider.dart';
import '../../../../common_widgets/datePicker/DatePickerTextField_DateBirthday.dart';
import '../../../../common_widgets/dropDown/dropdownNationsGrouped.dart';
import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';

final TextEditingController continentController = TextEditingController();

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormPersonalDateWidget({required this.formKey, super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() =>
      _FormPersonalDateWidget();
}

class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _teamController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: ref.read(namePlayerProvider));
    _surnameController = TextEditingController(text: ref.read(surnamePlayerProvider));
    _teamController = TextEditingController(text: ref.read(teamPlayProvider));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final continent = ref.watch(continentProvider);

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
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView( // <-- Qui aggiungo lo scroll
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TextFormField for name player
                      TextFormField(
                        validator: Helper.validateNameSurnameFoot,
                        controller: _nameController,
                        onChanged: (value) => ref.read(namePlayerProvider.notifier).state = value,
                        decoration: const InputDecoration(
                            labelText: tName,
                            prefixIcon: Icon(LineAwesomeIcons.user),
                            hintText: tName),
                      ),

                      SizedBox(height: 12),

                      //TextFormField for surname player
                      TextFormField(
                        validator: Helper.validateNameSurnameFoot,
                        controller: _surnameController,
                        onChanged: (value) => ref.read(surnamePlayerProvider.notifier).state = value,
                        decoration: const InputDecoration(
                            labelText: tSurname,
                            prefixIcon: Icon(LineAwesomeIcons.user),
                            hintText: tSurname),
                      ),

                      SizedBox(height: 12),

                      //DataPicker for date of birthday
                      DatePickerTextField(dateProvider: dateOfBirthdayProvider),

                      SizedBox(height: 12),

                      //TextFormField for team player
                      TextFormField(
                        validator: Helper.validateEmail,
                        controller: _teamController,
                        onChanged: (value) => ref.read(teamPlayProvider.notifier).state = value,
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
                        initialValue: continent ?? '',
                        decoration: const InputDecoration(
                          labelText: tContinent,
                          prefixIcon: Icon(LineAwesomeIcons.globe_solid),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
