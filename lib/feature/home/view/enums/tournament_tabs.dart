enum TournamentTab { detail, matches, offers, ranking, pyramid }

extension TournamentTabExtension on TournamentTab {
  String get title {
    switch (this) {
      case TournamentTab.detail:
        return "Detaylar";
      case TournamentTab.matches:
        return "Maçlar";
      case TournamentTab.offers:
        return "Teklifler";
      case TournamentTab.ranking:
        return "Sıralama";
      case TournamentTab.pyramid:
        return "Piramit";
    }
  }

  String get iconPath {
    switch (this) {
      case TournamentTab.detail:
        return 'assets/icons/detail.svg';
      case TournamentTab.matches:
        return 'assets/icons/ball.svg';
      case TournamentTab.offers:
        return 'assets/icons/handshake.svg';
      case TournamentTab.ranking:
        return 'assets/icons/bar.svg';
      case TournamentTab.pyramid:
        return 'assets/icons/bracket.svg';
    }
  }
}
