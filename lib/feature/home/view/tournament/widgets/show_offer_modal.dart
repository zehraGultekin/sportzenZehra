import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class MatchPlannerContent extends StatefulWidget {
  final String playerName;
  const MatchPlannerContent({super.key, required this.playerName});

  @override
  State<MatchPlannerContent> createState() => _MatchPlannerContentState();
}

class _MatchPlannerContentState extends State<MatchPlannerContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
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
                  '${widget.playerName} ile Maç Planla',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.black10,
            indent: 0,
            endIndent: 0,
          ),
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
                          children:
                              [
                                    '11 Eylül Perşembe',
                                    '12 Eylül Cuma',
                                    '13 Eylül Cumartesi',
                                    '14 Eylül Pazar',
                                  ]
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
                          children:
                              ['09:00', '10:00', '11:00', '12:00', '13:00']
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
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Müsait Kortlar',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _CourtCard(
                  iconColor: Colors.brown,
                  courtName: 'KORT 2',
                  surfaceType: 'Toprak Zemin',
                  surfaceColor: Colors.brown.shade100,
                ),
                _CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 3',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                _CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 1',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                _CourtCard(
                  iconColor: AppColors.blue,
                  courtName: 'KORT 4',
                  surfaceType: 'Sert Zemin',
                  surfaceColor: AppColors.blue.withValues(alpha: 0.1),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      "Maç Teklifi Gönder",
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
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

class _CourtCard extends StatelessWidget {
  final Color iconColor;
  final String courtName;
  final String surfaceType;
  final Color surfaceColor;

  const _CourtCard({
    required this.iconColor,
    required this.courtName,
    required this.surfaceType,
    required this.surfaceColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: surfaceColor,
            child: Icon(
              Icons.sports_baseball_rounded,
              size: 20,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            courtName,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: surfaceColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              surfaceType,
              style: theme.textTheme.bodySmall?.copyWith(
                color: iconColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
