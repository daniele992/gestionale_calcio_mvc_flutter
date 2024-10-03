import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/colors.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/view/profile/update_profile_screen.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/view/profile/widgets/profile_menu.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left_solid)), //angle_left?
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium), //headline4?
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage)))
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                        child: const Icon(
                            LineAwesomeIcons.pencil_alt_solid,
                            color: Colors.black,
                            size: 20
                        ),
                      ),
                    ),
                   ],
                  ),
                  const SizedBox(height: 10),
                  Text(tProfileHeading, style: Theme.of(context).textTheme.headlineMedium), //headline4?
                  Text(tProfileSubHeading, style: Theme.of(context).textTheme.bodyMedium), //bodyText2?
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                      child: const Text(tEditProfile, style: TextStyle(color: tDarkColor))
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  ///Menu
                  ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog_solid, onPress: (){}), //cog
                  ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet_solid, onPress: (){}),
                  ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check_solid, onPress: (){}),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info_solid, onPress: (){}),
                  ProfileMenuWidget(
                      title: "Logout",
                      icon: LineAwesomeIcons.sign_out_alt_solid, //alternate_sign_out
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: (){}
                  ),
            ],
          ),
        ),
      ),
    );
  }
}



