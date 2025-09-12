import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/data/mock/reservation_mock.dart';
import 'package:sportzenzehra/feature/home/data/mock/reservation_mock_data.dart';
import 'package:sportzenzehra/feature/home/provider/reservation_detail_provider.dart';
import 'package:sportzenzehra/feature/home/provider/select_branch_provider.dart';
import 'package:sportzenzehra/feature/home/view/widgets/reservation_card_widget.dart';

class ReservationDetail2 extends ConsumerWidget {
  const ReservationDetail2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedIndex = ref.watch(reservationProvider);
    final selectedBranch = ref.watch(selectedBranchProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Rezervasyon",
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedIndex != null ? reserveList[selectedIndex].date : "",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            Text(
              selectedIndex != null ? reserveList[selectedIndex].day : "Pazar",
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 75,
              child: ListView.builder(
                itemCount: reserveList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final reserve = reserveList[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      ref.read(reservationProvider.notifier).selectDate(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      child: Container(
                        height: 4,
                        width: 57,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : AppColors.grey.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              reserve.subtitle.substring(0, 3),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isSelected ? Colors.white : null,
                                height: 1,
                              ),
                            ),
                            Text(
                              reserve.title,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : null,
                                fontSize: 16,
                                height: 1,
                              ),
                            ),
                            Text(
                              reserve.day.substring(0, 3),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isSelected ? Colors.white : null,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.opacitygrey),
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.schedule, size: 16),
                          Text(
                            "Tümü",
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    if (selectedIndex != null &&
                        selectedBranch?.name == "Tenis")
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sahalar", style: theme.textTheme.titleLarge),

                          GestureDetector(
                            onTap: () {
                              ref.read(kort4Provider.notifier).expanded();
                            },
                            child: ReservationCard(
                              kortName: "4. KORT",
                              type: "Tenis",
                              surface: "Sert Zemin",
                              imageAsset: "assets/images/kort.webp",
                              backgroundColor: AppColors.blue,
                              reservations: kort4,
                              isExpanded: ref.watch(kort4Provider),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(kort1Provider.notifier).expanded();
                            },
                            child: ReservationCard(
                              kortName: "KORT 1",
                              type: "Tenis",
                              surface: "Sert Zemin",
                              imageAsset: "assets/images/kort2.jpg",
                              backgroundColor: AppColors.blue,
                              reservations: kort4,
                              isExpanded: ref.watch(kort1Provider),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(kort2Provider.notifier).expanded();
                            },
                            child: ReservationCard(
                              kortName: "KORT 2",
                              type: "Tenis",
                              surface: "Toprak Zemin",
                              imageAsset: "assets/images/kort2.jpg",
                              backgroundColor: AppColors.soil,
                              reservations: kort4,
                              isExpanded: ref.watch(kort2Provider),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(kort3Provider.notifier).expanded();
                            },
                            child: ReservationCard(
                              kortName: "KORT 3",
                              type: "Tenis",
                              surface: "Sert Zemin",
                              imageAsset: "assets/images/applantis.jpg",
                              backgroundColor: AppColors.blue,
                              reservations: kort4,
                              isExpanded: ref.watch(kort3Provider),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
