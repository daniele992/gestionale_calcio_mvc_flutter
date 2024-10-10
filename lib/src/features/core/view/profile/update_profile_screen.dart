import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/colors.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/core/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../authentication/models/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headlineMedium), //headLine4
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            //future: controller.getAllUser(),
            future: controller.getUserData(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  //UserModel userData = snapshot.data as UserModel;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(LineAwesomeIcons.user),
                            title: Text("Name: ${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      );
                    }

                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              }else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}