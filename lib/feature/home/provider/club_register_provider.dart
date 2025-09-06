import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/models/selection_input.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

//final clubCityProvider = StateProvider<String?>((ref) => null);
//final clubBranchProvider = StateProvider<BranchModel?>((ref) => null);

final clubCityProvider = StateNotifierProvider<SelectedCityNotifier, String?>(
  (ref) => SelectedCityNotifier(),
);
final clubBranchProvider =
    StateNotifierProvider<SelectedBranchNotifier, BranchModel?>(
      (ref) => SelectedBranchNotifier(),
    );
