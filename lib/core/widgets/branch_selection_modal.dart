import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';
import 'package:sportzenzehra/feature/home/data/models/selection_input.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

class BranchSelectionModal extends ConsumerWidget {
  final StateNotifierProvider<SelectedBranchNotifier, BranchModel?>
  branchProvider;
  const BranchSelectionModal(this.branchProvider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedHeader = ref.watch(selectedHeaderProvider);
    final branches = selectedHeader.name == "Sporzen Public"
        ? SelectionInputModel.branches
        : SelectionInputModel.branches
              .where((b) => b.name == "Futbol" || b.name == "Tenis")
              .toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grey.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Branş Seç",
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: branches.length,
              itemBuilder: (context, index) {
                final branch = branches[index];
                return Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.grey.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(selectedBranchProvider.notifier)
                          .selectedBranch(branch);
                      context.pop();
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        branch.icon,
                        SizedBox(width: 10),
                        Text(branch.name, style: AppTextStyles.selectionvalue),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
