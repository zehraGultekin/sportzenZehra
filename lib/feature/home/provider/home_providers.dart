import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/mock/category_mock.dart';
import 'package:sportzenzehra/feature/home/data/models/header_club.dart';
import 'package:sportzenzehra/feature/home/data/models/header_content.dart';
import 'package:sportzenzehra/feature/home/data/models/selection_input.dart';

class HeaderExpandedNotifier extends StateNotifier<bool> {
  HeaderExpandedNotifier() : super(false);

  void expanded() {
    state = !state;
  }
}

class SelectedCityNotifier extends StateNotifier<String?> {
  SelectedCityNotifier() : super(null);

  void selectedCity(String city) {
    state = city;
  }
}

class SelectedHeaderNotifier extends StateNotifier<HeaderModel> {
  SelectedHeaderNotifier()
    : super(
        HeaderModel(name: "Sporzen Public", logoPath: "assets/images/logo.png"),
      );

  void selectClub(HeaderModel club) {
    state = club;
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

class TabIndexNotifier extends StateNotifier<int> {
  TabIndexNotifier() : super(0);
  void selectedIndex(int index) {
    state = index;
  }
}

class MatchOfferNotifier extends StateNotifier<String?> {
  MatchOfferNotifier() : super(null);

  void selectChoose(String chose) {
    state = chose;
  }
}

final tabIndexProvider = StateNotifierProvider<TabIndexNotifier, int>(
  (ref) => TabIndexNotifier(),
);

final tournamentTabProvider = StateNotifierProvider<TabIndexNotifier, int>(
  (ref) => TabIndexNotifier(),
);

final headerContentProvider = Provider<HeaderContent>((ref) {
  final selectedHeader = ref.watch(selectedHeaderProvider);

  if (selectedHeader.name == "Sporzen Public") {
    return HeaderContent(
      cards: sportzenCards,
      showCitySelection: true,
      showBranchSelection: true,
    );
  } else {
    return HeaderContent(
      cards: applantisCards,
      showCitySelection: false,
      showBranchSelection: true,
    );
  }
});

final headerExpandedProvider =
    StateNotifierProvider<HeaderExpandedNotifier, bool>(
      (ref) => HeaderExpandedNotifier(),
    );

final selectedCityProvider =
    StateNotifierProvider<SelectedCityNotifier, String?>(
      (ref) => SelectedCityNotifier(),
    );

final selectedBranchProvider =
    StateNotifierProvider<SelectedBranchNotifier, BranchModel?>(
      (ref) => SelectedBranchNotifier(),
    );

final currentPageProvider = StateNotifierProvider<CurrentPageNotifier, int>(
  (ref) => CurrentPageNotifier(),
);

final selectedHeaderProvider =
    StateNotifierProvider<SelectedHeaderNotifier, HeaderModel>(
      (ref) => SelectedHeaderNotifier(),
    );

final matchOfferNotifierProvider =
    StateNotifierProvider<MatchOfferNotifier, String?>(
      (ref) => MatchOfferNotifier(),
    );
