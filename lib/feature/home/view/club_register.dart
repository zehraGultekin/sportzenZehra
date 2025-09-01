import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/utils/modal_helpers.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/provider/club_register_provider.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';

class ClubRegisterView extends ConsumerStatefulWidget {
  const ClubRegisterView({super.key});

  @override
  ConsumerState<ClubRegisterView> createState() => _ClubRegisterViewState();
}

class _ClubRegisterViewState extends ConsumerState<ClubRegisterView> {
  @override
  Widget build(BuildContext context) {
    final selectedCity = ref.watch(selectedCityClubProvider);
    final selectedBranch = ref.watch(selectedBranchClubProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kulüp Seç",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
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
                  child: SelectionCard(
                    icon: Icons.location_city_outlined,
                    title: "Şehir",
                    value: selectedCity ?? "Şehir Seçin",
                    onTap: () =>
                        showCityModal(context, selectedCityClubProvider),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SelectionCard(
              icon: Icons.sports_baseball_outlined,
              title: "Branş",
              value: selectedBranch?.name ?? "Şeçiniz",
              onTap: () => showBranchModal(context, selectedBranchClubProvider),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kulübünüz listede yok mu?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Eğer bi Kulüp işletmecisi iseniz kulübünüzü\nkaydetmek için dokunun.",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 12),
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
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Aramaya başlamak için şehir veya branş seçmeni gerekmektedir",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
