import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

final selectedCityProvider = StateProvider<String?>((ref) => null);
final selectedBranchProvider = StateProvider<BranchModel?>((ref) => null);
