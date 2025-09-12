import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentPageNotifier extends StateNotifier<int> {
  CurrentPageNotifier() : super(0);

  void changePage(int value) {
    state = value;
  }
}

final currentPageProvider = StateNotifierProvider<CurrentPageNotifier, int>(
  (ref) => CurrentPageNotifier(),
);
