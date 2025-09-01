import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';
import 'package:sportzenzehra/feature/home/view/widgets/show_modal_branch.dart';
import 'package:sportzenzehra/feature/home/view/widgets/show_modal_city.dart';

void showBranchModal(
  BuildContext context,
  StateProvider<BranchModel?> branchProvider,
) {
  showModalBottomSheet(
    context: context,
    builder: (context) => ShowModalBranch(branchProvider),
  );
}

void showCityModal(BuildContext context, StateProvider<String?> cityProvider) {
  showModalBottomSheet(
    context: context,
    builder: (context) => ShowModalCity(cityProvider),
  );
}
