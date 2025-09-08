import 'package:flutter_riverpod/flutter_riverpod.dart';

class RezervationDetailNotifier extends StateNotifier<int?> {
  RezervationDetailNotifier() : super(0);

  void selectDate(int index) {
    state = index;
  }
}

class Reservation2Notifier extends StateNotifier<bool> {
  Reservation2Notifier() : super(false);
  void expanded() {
    state = !state;
  }
}

final kort4Provider = StateNotifierProvider<Reservation2Notifier, bool>(
  (ref) => Reservation2Notifier(),
);

final kort1Provider = StateNotifierProvider<Reservation2Notifier, bool>(
  (ref) => Reservation2Notifier(),
);
final kort2Provider = StateNotifierProvider<Reservation2Notifier, bool>(
  (ref) => Reservation2Notifier(),
);
final kort3Provider = StateNotifierProvider<Reservation2Notifier, bool>(
  (ref) => Reservation2Notifier(),
);

final reservationProvider =
    StateNotifierProvider<RezervationDetailNotifier, int?>(
      (ref) => RezervationDetailNotifier(),
    );
