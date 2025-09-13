import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/provider/page_controller_provider.dart';
import 'package:sportzenzehra/feature/home/provider/tab_provider.dart';
import 'package:sportzenzehra/feature/home/view/club_register/atdsk_about_view.dart';
import 'package:sportzenzehra/feature/home/view/club_register/atdsk_comminication.dart';
import 'package:sportzenzehra/feature/home/view/club_register/atdsk_rules.dart';
import 'package:sportzenzehra/feature/home/view/enums/tabs_enum.dart';

class AtdskClubInfo extends ConsumerStatefulWidget {
  const AtdskClubInfo({super.key});

  @override
  ConsumerState<AtdskClubInfo> createState() => _ClubDetailViewState();
}

class _ClubDetailViewState extends ConsumerState<AtdskClubInfo> {
  final tabs = ClubInfo.values;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageController = ref.watch(clubProvider);

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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          spacing: 20,
          children: [
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
                        "Applantis Tenis Dağ ve Su Sporları\nKulübü",
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
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
                              color: Colors.white,

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
                children: [
                  AtdskInfoView(),
                  AtdskCommunicationView(),
                  AtdskRules(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
