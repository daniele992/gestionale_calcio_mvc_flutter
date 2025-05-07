// page_controller_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageControllerNotifier extends StateNotifier<int> {
  final PageController controller = PageController();

  PageControllerNotifier() : super(0) {
    controller.addListener(_pageListener);
  }

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

final pageControllerProvider =
StateNotifierProvider<PageControllerNotifier, int>((ref) {
  return PageControllerNotifier();
});