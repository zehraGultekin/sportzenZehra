import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/models/selection_input.dart';

class SelectedBranchNotifier extends StateNotifier<BranchModel?> {
  SelectedBranchNotifier() : super(null);

  void selectedBranch(BranchModel branch) {
    state = branch;
  }
}

final selectedBranchProvider =
    StateNotifierProvider<SelectedBranchNotifier, BranchModel?>(
      (ref) => SelectedBranchNotifier(),
    );

final clubBranchProvider =
    StateNotifierProvider<SelectedBranchNotifier, BranchModel?>(
      (ref) => SelectedBranchNotifier(),
    );
