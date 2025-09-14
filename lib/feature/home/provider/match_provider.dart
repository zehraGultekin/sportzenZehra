import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/view/enums/match_enums.dart';

class MatchNotifier extends StateNotifier<MatchList> {
  MatchNotifier() : super(MatchList.all);

  void selectChoose(MatchList chose) {
    state = chose;
  }
}

final matchNotifierProvider = StateNotifierProvider<MatchNotifier, MatchList>(
  (ref) => MatchNotifier(),
);
