import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCityNotifier extends StateNotifier<String?> {
  SelectedCityNotifier() : super(null);

  void selectedCity(String city) {
    state = city;
  }
}

final selectedCityProvider =
    StateNotifierProvider<SelectedCityNotifier, String?>(
      (ref) => SelectedCityNotifier(),
    );

final clubCityProvider = StateNotifierProvider<SelectedCityNotifier, String?>(
  (ref) => SelectedCityNotifier(),
);
