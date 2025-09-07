import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/data/mock/reservation_mock.dart';
import 'package:sportzenzehra/feature/home/provider/rezervation_detail_provider.dart';

class ReservationDetailView extends ConsumerWidget {
  const ReservationDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedIndex = ref.watch(reservationProvider);
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
              height: 70,
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green
                              : theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
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
                              ),
                            ),
                            Text(
                              reserve.title,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : null,
                              ),
                            ),
                            Text(
                              reserve.day.substring(0, 3),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isSelected ? Colors.white : null,
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
            if (selectedIndex != null)
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundGrey,
                      border: Border.all(
                        color: AppColors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            "Adana Tenis Dağ Ve Su Sporları\nKulübü",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Row(
                            spacing: 3,
                            children: [
                              Icon(Icons.sports_baseball, size: 15),
                              Text(
                                "Branşlar: Tenis , Futbol",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black70,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.sports_cricket_rounded,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                "Sahalar 1",
                                style: TextStyle(color: AppColors.black70),
                              ),
                            ],
                          ),
                          Text(
                            "Yoğunluk",
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.8,
                              ),
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            height: 8,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            "Ücret: ${reserveList[selectedIndex].fee}",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 30,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/newlogo.png"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
