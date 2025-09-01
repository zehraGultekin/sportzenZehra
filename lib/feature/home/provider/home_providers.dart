import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

final selectedCityProvider = StateProvider<String?>((ref) => null);
final selectedBranchProvider = StateProvider<BranchModel?>((ref) => null);
final headerExpandedProvider = StateProvider<bool>((ref) => false);
final currentPageProvider = StateProvider<int>((ref) => 0);
