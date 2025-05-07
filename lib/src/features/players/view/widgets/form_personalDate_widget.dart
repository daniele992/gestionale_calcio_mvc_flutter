import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/text_strings.dart';
import '../../../../utils/helper/helper_controller.dart';

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  const FormPersonalDateWidget({super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() =>
      _FormPersonalDateWidget();
}

class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  @override
  Widget build(BuildContext context) {

    //final controller = Get.put(LoginController());

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
                TextFormField(
                  validator: Helper.validateNameAndSurname,
                  //controller: controller.email,
                  decoration: const InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail),
                ),
                SizedBox(height: 12),
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
                TextFormField(
                  validator: Helper.validateEmail,
                  //controller: ,
                  decoration: const InputDecoration(
                      labelText: 'Nazionalità',
                      prefixIcon: Icon(LineAwesomeIcons.user),
                      hintText: tEmail
                  ),
                ),
                // Aggiungi altri campi qui se necessario
              ],
            ),
          ),
        ),
      ],
    );
  }
}
