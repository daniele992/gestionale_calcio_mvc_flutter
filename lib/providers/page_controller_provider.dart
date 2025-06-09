import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Manages a PageController and keeps the current page state updated. When the page changes, it updates the state.
class PageControllerNotifier extends StateNotifier<int> {
  final PageController controller = PageController();

  ///Constructor: when creating PageControllerNotifier, it initializes the state to 0 (initial page).
  PageControllerNotifier() : super(0) {
    controller.addListener(_pageListener);
  }

  ///This function takes the current page value and rounds it to the nearest integer.
  ///If the current page is different from the saved state, it updates the state with the new page.
  void _pageListener() {
    final current = controller.page?.round() ?? 0;
    if (current != state) {
      state = current;
    }
  }


  @override
  void dispose() {
    controller.removeListener(_pageListener);
    controller.dispose();
    super.dispose();
  }
}

///This provider makes the logic available throughout the app via Riverpod. It will be used to read or modify the current page state.
final pageControllerProvider =
StateNotifierProvider<PageControllerNotifier, int>((ref) {
  return PageControllerNotifier();
});