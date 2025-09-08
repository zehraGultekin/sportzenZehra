import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/mock/banner_mock.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/widgets/banner_widget.dart';
import 'package:sportzenzehra/feature/home/view/widgets/category_card_widget.dart';
import 'package:sportzenzehra/feature/home/view/widgets/header_widget.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';
import 'package:sportzenzehra/core/widgets/branch_selection_modal.dart';
import 'package:sportzenzehra/core/widgets/city_selection_modal.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final headerContent = ref.watch(headerContentProvider);
    final selectedHeader = ref.watch(selectedHeaderProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/userlogo.png",
                            width: 40,
                            height: 50,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Zehra Gültekin",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    HomeBannerWidget(),

                    SizedBox(height: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        final currentPage = ref.watch(currentPageProvider);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(bannerItems.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: currentPage == index
                                    ? theme.colorScheme.secondary
                                    : Colors.grey,
                              ),
                            );
                          }),
                        );
                      },
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (headerContent.cards[0].title ==
                                  "Kulüp Kayıt") {
                                context.pushNamed(AppRoutes.clubRegister.name);
                              } else if (headerContent.cards[0].title ==
                                  "Turnuvalar") {
                                context.pushNamed(AppRoutes.tournamend.name);
                              }
                            },
                            child: CategoryWidget(
                              model: headerContent.cards[0],
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoutes.news.name);
                            },
                            child: CategoryWidget(
                              model: headerContent.cards[1],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: theme.colorScheme.secondary,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Rezervasyon",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    if (headerContent.showCitySelection)
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
                                final selectedCity = ref.watch(
                                  selectedCityProvider,
                                );
                                return SelectionCard(
                                  icon: Icons.location_on_outlined,
                                  title: "Şehir",
                                  value: selectedCity ?? "Şehir Seçin",
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SelectionCityModal(
                                          selectedCityProvider,
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                    if (headerContent.showBranchSelection)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final selectedBranch = ref.watch(
                              selectedBranchProvider,
                            );
                            return SelectionCard(
                              icon: Icons.sports_baseball_outlined,
                              title: "Branş",
                              value: selectedBranch?.name ?? "Seçiniz",
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BranchSelectionModal(
                                      selectedBranchProvider,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),

                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        final city = ref.read(selectedCityProvider);
                        final branch = ref.read(selectedBranchProvider);
                        String? errorMessage;

                        if (headerContent.showCitySelection &&
                            city == null &&
                            branch == null) {
                          errorMessage = "Şehir ve branş seçmeniz gerekiyor";
                        } else if (headerContent.showCitySelection &&
                            city == null) {
                          errorMessage = "Şehir seçmeniz gerekiyor";
                        } else if (headerContent.showBranchSelection &&
                            branch == null) {
                          errorMessage = "Branş seçmeniz gerekiyor";
                        }

                        if (errorMessage != null) {
                          final snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: theme.colorScheme.error,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: theme.colorScheme.error,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      errorMessage,
                                      style: theme.textTheme.labelMedium
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).hideCurrentSnackBar();
                                    },
                                    child: Text(
                                      "Kapat",
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: AppColors.black70),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            duration: Duration(seconds: 10),
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                        if (selectedHeader.name == 'Sporzen Public') {
                          context.pushNamed(AppRoutes.reservationDetail.name);
                        } else {
                          context.pushNamed(AppRoutes.reservation2.name);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.colorScheme.secondary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: theme.colorScheme.onPrimary,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Sahaları Ara",
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
