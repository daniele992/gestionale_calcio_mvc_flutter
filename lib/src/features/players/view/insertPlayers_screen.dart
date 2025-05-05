import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_personalDate_widget.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/players/view/widgets/form_physicalDate_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final formKeyProvider = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});


class InsertPlayers extends ConsumerStatefulWidget {
  const InsertPlayers({super.key});

  @override
  ConsumerState<InsertPlayers> createState() => _InsertPlayersState();
}

class _InsertPlayersState extends ConsumerState<InsertPlayers> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(formKeyProvider);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ⬇️ CARD WITH FORM AND PAGEVIEW
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
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        FormPersonalDateWidget(),
                        FormPhysicalDateWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Mostra solo se siamo all'ultima pagina
                  if (_currentPage == 1)
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Dati salvati')),
                          );
                        }
                      },
                      child: const Text('Salva'),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 16,
              activeDotColor: Colors.blueAccent,
              dotColor: Colors.grey.shade300,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
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
