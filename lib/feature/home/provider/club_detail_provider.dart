import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/mock/club_mock.dart';
import 'package:sportzenzehra/feature/home/data/models/club_model.dart';

final clubDetailProvider = Provider.family<ClubModel, String>((ref, clubId) {
  return allClubsData.firstWhere((club) => club.id == clubId);
});
