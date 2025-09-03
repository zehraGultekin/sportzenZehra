import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

// final selectedCityProvider = StateProvider<String?>((ref) => null);
// final selectedBranchProvider = StateProvider<BranchModel?>((ref) => null);
// final headerExpandedProvider = StateProvider<bool>((ref) => false);
//final currentPageProvider = StateProvider<int>((ref) => 0);

class HeaderExpandedNotifier extends StateNotifier<bool> {
  HeaderExpandedNotifier() : super(false);

  void expanded() {
    state = !state;
  }
}

class SelectedCityNotifier extends StateNotifier<String> {
  SelectedCityNotifier() : super(""); /*  */

  void selectedCity(String city) {
    state = city;
  }
}

class SelectedBranchNotifier extends StateNotifier<BranchModel?> {
  SelectedBranchNotifier() : super(null);

  void selectedBranch(BranchModel branch) {
    state = branch;
  }
}

class CurrentPageNotifier extends StateNotifier<int> {
  CurrentPageNotifier() : super(0);

  void changePage(int value) {
    state = value;
  }
}

final headerExpandedProvider =
    StateNotifierProvider<HeaderExpandedNotifier, bool>(
      (ref) => HeaderExpandedNotifier(),
    );

final selectedCityProvider =
    StateNotifierProvider<SelectedCityNotifier, String>(
      (ref) => SelectedCityNotifier(),
    );

final selectedBranchProvider =
    StateNotifierProvider<SelectedBranchNotifier, BranchModel?>(
      (ref) => SelectedBranchNotifier(),
    );

final currentPageProvider = StateNotifierProvider<CurrentPageNotifier, int>(
  (ref) => CurrentPageNotifier(),
);
