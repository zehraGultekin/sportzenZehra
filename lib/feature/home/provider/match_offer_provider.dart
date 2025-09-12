import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/view/enums/match_offer_enum.dart';

class MatchOfferNotifier extends StateNotifier<MatchOffer> {
  MatchOfferNotifier() : super(MatchOffer.all);

  void selectChoose(MatchOffer chose) {
    state = chose;
  }
}

final matchOfferNotifierProvider =
    StateNotifierProvider<MatchOfferNotifier, MatchOffer>(
      (ref) => MatchOfferNotifier(),
    );
