import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/club_info/about_club.dart';
import 'package:sportzenzehra/feature/home/view/club_info/communication_view.dart';
import 'package:sportzenzehra/feature/home/view/club_info/rules_view.dart';

class ClubInfoView extends ConsumerStatefulWidget {
  const ClubInfoView({super.key});

  @override
  ConsumerState<ClubInfoView> createState() => _ClubInfoViewState();
}

class _ClubInfoViewState extends ConsumerState<ClubInfoView> {
  late PageController _controller;

  final tabs = ["Hakkında", "İletişim", "Kurallar"];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.backgroundGrey,
              border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/newlogo.png"),
                ),
                const SizedBox(width: 30),
                Text(
                  "Applantis Tenis Kulübü",
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
                        _controller.jumpToPage(index);
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
                          tabs[index],
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
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                ref.read(tabIndexProvider.notifier).selectedIndex(index);
              },
              children: [
                ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(scrollbars: false),
                  child: AboutClubView(),
                ),
                ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(scrollbars: false),
                  child: CommunicationView(),
                ),
                ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(scrollbars: false),
                  child: RulesView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
