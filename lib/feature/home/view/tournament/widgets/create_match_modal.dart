import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/mock/create_match_modal.dart';
import 'package:sportzenzehra/feature/home/view/enums/planner_mode.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/select_court_widget.dart';

class CreateMatchModal extends StatefulWidget {
  final PlannerMode mode;
  final String? playerName;
  const CreateMatchModal({super.key, required this.mode, this.playerName});

  @override
  State<CreateMatchModal> createState() => _CreateMatchModalState();
}

class _CreateMatchModalState extends State<CreateMatchModal> {
  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String title;
    final String buttonText;

    if (widget.mode == PlannerMode.edit) {
      title = 'Maç planı düzenleme';
      buttonText = 'Değişiklikleri Kaydet';
    } else {
      title = '${widget.playerName} ile Maç Planla';
      buttonText = 'Maç Teklifi Gönder';
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColors.black10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (index) {},
                          children: PlannerData.days
                              .map(
                                (text) => Center(
                                  child: Text(
                                    text,
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: AppColors.black80,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CupertinoPicker(
                          itemExtent: 30,
                          onSelectedItemChanged: (index) {},
                          children: PlannerData.times
                              .map(
                                (text) => Center(
                                  child: Text(
                                    text,
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: AppColors.black70,
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'Seçilen Tarih: 11 Eylül Perşembe 09:00',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Müsait Kortlar',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CourtCard(
                  iconColor: Colors.brown,
                  courtName: 'KORT 2',
                  surfaceType: 'Toprak Zemin',
                  surfaceColor: Colors.brown.shade100,
                ),
                CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 3',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 1',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 4',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                GestureDetector(
                  onTap: () {
                    if (widget.mode == PlannerMode.edit) {
                    } else {}
                    context.pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.secondary,
                    ),
                    child: Center(
                      child: Text(
                        buttonText,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
