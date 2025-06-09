import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_ratingDate_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_personalDate_widget.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_physicalDate_widget.dart';

import '../../../../providers/page_controller_provider.dart';
import '../../authentication/controllers/login_controller.dart';
import '../controller/insertPlayers_controller.dart';



class InsertPlayers extends ConsumerWidget {
  const InsertPlayers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final formKey = ref.watch(formKeyProvider);
    final currentPage = ref.watch(pageControllerProvider);
    final pageController = ref.read(pageControllerProvider.notifier).controller;
    final titlePage = ['Dati Anagrafici', 'Dati Fisici', 'Voto'];
    final controller = Get.put(InsertPlayersController());
    String title = titlePage[currentPage];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ⬆️ TITLE
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 🟦 CARD CON FORM
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.65,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
            ),
            child: Form(
              key: controller.playersFormKey,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        FormPersonalDateWidget(),
                        FormPhysicalDateWidget(),
                        FormRateDateWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (currentPage == 2)
                    ElevatedButton(
                      onPressed: () {
                        /*if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Dati salvati')),
                          );
                        } */
                      },
                      child: const Text('Salva'),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 🔘 INDICATORE PAGINA
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 16,
              activeDotColor: Colors.blueAccent,
              dotColor: Colors.grey.shade300,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}