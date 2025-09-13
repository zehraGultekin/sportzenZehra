import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/view/enums/match_enums.dart';

class MatchNotifier extends StateNotifier<Match> {
  MatchNotifier() : super(Match.all);

  void selectChoose(Match chose) {
    state = chose;
  }
}

final matchNotifierProvider = StateNotifierProvider<MatchNotifier, Match>(
  (ref) => MatchNotifier(),
);
