import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/models/user_model.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({
    super.key,
    required this.user,
    required this.email,
    required this.phoneNo,
    required this.fullName,
    required this.password,
    required this.privacyPolicy,
    required this.conditions
  });

  final UserModel user;
  final TextEditingController email;
  final TextEditingController phoneNo;
  final TextEditingController fullName;
  final TextEditingController password;
  final TextEditingController privacyPolicy;
  final TextEditingController conditions;

  @override
  Widget build(BuildContext context){

    final controller = Get.put(ProfileController());

    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: fullName,
            decoration: const InputDecoration(label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
          ),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope)),
          ),
          const SizedBox(height: tFormHeight - 20),
          TextFormField(
            controller: phoneNo,
            decoration: const InputDecoration(label: Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone_solid)),
          ),
          const SizedBox(height: tFormHeight),

          /// -- Form Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  final userData = UserModel(
                    id: user.id,
                    email: email.text.trim(),
                    fullName: fullName.text.trim(),
                    phoneNo: phoneNo.text.trim(),
                    privacyPolicy: privacyPolicy.text.isBool,
                    conditions: conditions.text.isBool,
                  );

                  await controller.updateRecord(userData);
                },
                child: const Text(tEditProfile),
            ),
          ),
          const SizedBox(height: tFormHeight),

          /// -- Created Date and Delete Button
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Text.rich(
                TextSpan(
                  text: tJoined,
                  style: TextStyle(fontSize: 12),
                  children: [
                    TextSpan(text: tJoinedAt, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 12))
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withOpacity(0.1),
                    elevation: 0,
                    foregroundColor: Colors.red,
                    side: BorderSide.none
                  ),
                  child: const Text(tDelete),
              ),
            ],
          )
        ],
      ),
    );
  }
}