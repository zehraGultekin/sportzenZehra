import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/mock/header_mock.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/club_info/club_info_view.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isExpanded = ref.watch(headerExpandedProvider);
    final selectedHeader = ref.watch(selectedHeaderProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(selectedHeader.logoPath),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      selectedHeader.name,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (selectedHeader.name != "Sporzen Public")
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.80,
                          child: ClubInfoView(),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.info, color: theme.colorScheme.primary),
                ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  ref.read(headerExpandedProvider.notifier).expanded();
                },
                child: AnimatedRotation(
                  //arrowcircledown ikonunu sadece olacak şekilde kullanabilirim
                  turns: isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: isExpanded ? 1.3 : 0,
              child: Column(
                spacing: 10,
                children: [
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundGrey,
                        hintText: "Ara",
                        hintStyle: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.grey,
                          fontSize: 17,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.opacitygrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppColors.opacitygrey),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    spacing: 10,
                    children: clubList.map((club) {
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedHeaderProvider.notifier)
                              .selectClub(club);
                          ref.read(headerExpandedProvider.notifier).expanded();
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundGrey,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.opacitygrey,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(club.logoPath),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                club.name,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
