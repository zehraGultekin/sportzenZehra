import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/mock/category_mock.dart';
import 'package:sportzenzehra/feature/home/data/models/header_club.dart';
import 'package:sportzenzehra/feature/home/data/models/header_content.dart';

class HeaderExpandedNotifier extends StateNotifier<bool> {
  HeaderExpandedNotifier() : super(false);

  void expanded() {
    state = !state;
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

final selectedHeaderProvider =
    StateNotifierProvider<SelectedHeaderNotifier, HeaderModel>(
      (ref) => SelectedHeaderNotifier(),
    );
