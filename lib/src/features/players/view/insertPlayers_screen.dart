import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_ratingDate_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_personalDate_widget.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_physicalDate_widget.dart';
import '../../../../providers/insertPlayers_controller_provider.dart';
import '../../../../providers/page_controller_provider.dart';
import '../../../../providers/personalDate_provider.dart';
import '../../../../providers/physicalDate_provider.dart';
import '../../../../providers/ratingDate_provider.dart';
import '../../../common_widgets/player_snackbar_widgets.dart';

class InsertPlayers extends ConsumerStatefulWidget {
  const InsertPlayers({super.key});

  @override
  ConsumerState<InsertPlayers> createState() => _InsertPlayersState();
}

class _InsertPlayersState extends ConsumerState<InsertPlayers> {
  final _formKey = GlobalKey<FormState>(); // <-- QUI è persistente

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(pageControllerProvider);
    final pageController = ref.read(pageControllerProvider.notifier).controller;
    final titlePage = ['Dati Anagrafici', 'Dati Fisici', 'Voto'];
    final birthday = ref.read(dateOfBirthdayProvider);
    final formattedDateBirthday =
        birthday != null ? DateFormat('dd/MM/yyyy').format(birthday) : '';
    final dateObservation = ref.read(dateObservationProvider);
    final formattedDateObservation = dateObservation != null
        ? DateFormat('dd/MM/yyyy').format(dateObservation)
        : '';

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
              key: _formKey,
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
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Stai inserendo i seguenti dati:'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sectionTitle(
                                      "DATI PERSONALI:",
                                      icon: Icons.person,
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                    ),
                                    dataLine('Nome', ref.read(namePlayerProvider)),
                                    dataLine('Cognome', ref.read(surnamePlayerProvider)),
                                    dataLine('Data di nascita', formattedDateBirthday),
                                    dataLine('Squadra', ref.read(teamPlayProvider)),

                                    const SizedBox(height: 10),
                                    sectionTitle(
                                      "DATI FISICI:",
                                      icon: Icons.accessibility,
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                    ),
                                    dataLine('Altezza', ref.read(heightPlayerProvider)),
                                    dataLine('Peso', ref.read(weightPlayerProvider)),
                                    dataLine('Somatotipo', ref.read(somatotypeSelectedProvider)?.name),
                                    dataLine('Biotipo', ref.read(biotypeSelectedProvider)?.name),
                                    dataLine('Corporatura', ref.read(buildSelectedProvider)?.name),
                                    dataLine('Piede', ref.read(preferredFootProvider)),

                                    const SizedBox(height: 10),
                                    sectionTitle(
                                      "TIPSS:",
                                      icon: Icons.grade,
                                      color: Colors.blueGrey,
                                      fontSize: 16,
                                    ),
                                    dataLine('Data di osservazione', formattedDateObservation),
                                    dataLine('Tecnica', ref.read(ratingTechniqueProvider)?.toString()),
                                    dataLine('Intelligenza', ref.read(ratingIntelligenceProvider)?.toString()),
                                    dataLine('Personalità', ref.read(ratingPersonalityProvider)?.toString()),
                                    dataLine('Velocità', ref.read(ratingSpeedProvider)?.toString()),
                                    dataLine('Struttura', ref.read(ratingStructureProvider)?.toString()),
                                    dataLine('Totale Tipss', ref.read(totalRating)?.toString()),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Annulla'),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      Get.snackbar('Errore', 'Controlla i dati inseriti');
                                      return;
                                    }
                                    final controller = ref
                                        .read(insertPlayersControllerProvider);

                                    try {
                                      await controller.submitPlayer();
                                      Get.snackbar('Successo', 'Giocatore salvato');
                                      Navigator.of(context).pop();
                                    } catch (e) {
                                      Get.snackbar('Errore', 'Errore nel salvataggio');
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Conferma'),
                                ),
                              ],
                            );
                          },
                        );
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
