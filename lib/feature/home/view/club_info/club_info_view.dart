import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/provider/page_controller_provider.dart';
import 'package:sportzenzehra/feature/home/provider/tab_provider.dart';
import 'package:sportzenzehra/feature/home/view/club_info/about_club.dart';
import 'package:sportzenzehra/feature/home/view/club_info/communication_view.dart';
import 'package:sportzenzehra/feature/home/view/club_info/rules_view.dart';
import 'package:sportzenzehra/feature/home/view/enums/tabs_enum.dart';

class ClubInfoView extends ConsumerStatefulWidget {
  const ClubInfoView({super.key});

  @override
  ConsumerState<ClubInfoView> createState() => _ClubInfoViewState();
}

class _ClubInfoViewState extends ConsumerState<ClubInfoView> {
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(clubProvider);
    final tabs = ClubInfo.values;

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        spacing: 20,
        children: [
          Container(
            height: 4,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.colorScheme.secondary,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: double.infinity,

            decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              border: Border.all(color: AppColors.opacitygrey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/newlogo.png"),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Applantis Tenis Kulübü",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length, (index) {
              return Consumer(
                builder: (context, ref, child) {
                  final selectedIndex = ref.watch(tabIndexProvider);
                  bool isSelected = selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(tabIndexProvider.notifier)
                            .selectedIndex(index);
                        pageController.jumpToPage(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          tabs[index].title,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                ref.read(tabIndexProvider.notifier).selectedIndex(index);
              },
              children: [AboutClubView(), CommunicationView(), RulesView()],
            ),
          ),
        ],
      ),
    );
  }
}
