import 'package:flutter_riverpod/flutter_riverpod.dart';

class RezervationDetailNotifier extends StateNotifier<int?> {
  RezervationDetailNotifier() : super(0);

  void selectDate(int index) {
    state = index;
  }
}

final reservationProvider =
    StateNotifierProvider<RezervationDetailNotifier, int?>(
      (ref) => RezervationDetailNotifier(),
    );
