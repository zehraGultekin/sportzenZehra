import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/view/enums/tournament_tabs.dart';
import 'package:sportzenzehra/feature/home/provider/page_controller_provider.dart';
import 'package:sportzenzehra/feature/home/provider/tab_provider.dart';
import 'package:sportzenzehra/feature/home/view/tournament/detail_view.dart';
import 'package:sportzenzehra/feature/home/view/tournament/match_offer_view.dart';
import 'package:sportzenzehra/feature/home/view/tournament/matches_view.dart';
import 'package:sportzenzehra/feature/home/view/tournament/ranking_view.dart';
import 'package:sportzenzehra/feature/home/view/tournament/pyramid_view.dart';

class TournamentDetailView extends ConsumerStatefulWidget {
  const TournamentDetailView({super.key});

  @override
  ConsumerState<TournamentDetailView> createState() =>
      _TournamentDetailViewState();
}

class _TournamentDetailViewState extends ConsumerState<TournamentDetailView> {
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(tournamePageProvider);
    final tabs = TournamentTab.values;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/branch.svg',
                          width: 30,
                          height: 30,
                          colorFilter: const ColorFilter.mode(
                            Color(0xff2196f3),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tenis",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: theme.colorScheme.secondary.withOpacity(
                                0.1,
                              ),
                            ),
                            child: Text(
                              "Aktif",
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.pushNamed(AppRoutes.rules.name);
                            },
                            child: Text(
                              "Kurallar",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final tab = tabs[index];
                final selectedIndex = ref.watch(tournamentTabProvider);
                bool isSelected = selectedIndex == index;
                final Color activeColor = AppColors.blue;
                final Color inactiveColor = AppColors.black40;
                final Color itemColor = isSelected
                    ? activeColor
                    : inactiveColor;

                return GestureDetector(
                  onTap: () {
                    ref
                        .read(tournamentTabProvider.notifier)
                        .selectedIndex(index);
                    pageController.jumpToPage(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 1,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,

                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          tab.iconPath,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            itemColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          tab.title,
                          style: TextStyle(
                            color: itemColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                ref.read(tournamentTabProvider.notifier).selectedIndex(index);
              },
              children: [
                DetailView(),
                MatchCardWidget(),
                MatchOfferView(),
                RankingPage(),
                PyramidView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
