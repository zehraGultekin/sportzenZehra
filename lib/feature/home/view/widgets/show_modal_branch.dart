import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

class ShowModalBranch extends ConsumerWidget {
  final StateProvider<BranchModel?> branchProvider;
  const ShowModalBranch(this.branchProvider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Container(
            height: 4,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grey.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Branş Seç",
            style: AppTextStyles.headline1.copyWith(fontSize: 22),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: SelectionInputModel.branches.length,
              itemBuilder: (context, index) {
                final branch = SelectionInputModel.branches[index];
                return Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.grey.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(
                      branch.icon,
                      color: Colors.black.withValues(alpha: 0.8),
                    ),
                    title: Text(
                      branch.name,
                      style: AppTextStyles.selectionvalue,
                    ),
                    onTap: () {
                      ref.read(branchProvider.notifier).state = branch;
                      context.pop();
                    },
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
