import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/provider/club_register_provider.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';
import 'package:sportzenzehra/core/widgets/branch_selection_modal.dart';
import 'package:sportzenzehra/core/widgets/city_selection_modal.dart';

class ClubRegisterView extends ConsumerStatefulWidget {
  const ClubRegisterView({super.key});

  @override
  ConsumerState<ClubRegisterView> createState() => _ClubRegisterViewState();
}

class _ClubRegisterViewState extends ConsumerState<ClubRegisterView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kulüp Seç",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SelectionCard(
                    icon: Icons.location_on_outlined,
                    title: "Ülke",
                    value: "Türkiye",
                    onTap: null,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final selectedCity = ref.watch(clubCityProvider);

                      return SelectionCard(
                        icon: Icons.location_on_outlined,
                        title: "Şehir",
                        value: selectedCity ?? "Şehir Seçin",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SelectionCityModal(clubCityProvider);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Consumer(
              builder: (context, ref, child) {
                final selectedBranch = ref.watch(selectedBranchProvider);

                return SelectionCard(
                  icon: Icons.sports_baseball_outlined,
                  title: "Branş",
                  value: selectedBranch?.name ?? "Seçiniz",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BranchSelectionModal(clubBranchProvider);
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.backgroundGrey,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      radius: 20,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "Kulübünüz listede yok mu?",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black70,
                          ),
                        ),
                        Text(
                          "Eğer bi Kulüp işletmecisi iseniz kulübünüzü\nkaydetmek için dokunun.",
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 12,
                            color: AppColors.black60,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Kulüpler",
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.black.withValues(alpha: 0.8),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                "Aramaya başlamak için şehir veya branş seçmeniz gerekmektedir",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
