import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

final selectedCityClubProvider = StateProvider<String?>((ref) => null);
final selectedBranchClubProvider = StateProvider<BranchModel?>((ref) => null);
