import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/mock/banner_mock.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/widgets/banner_widget.dart';
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
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            "assets/images/userlogo.png",
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Zehra Gültekin",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
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
                    SizedBox(
                      height: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (headerContent.cards[0].title ==
                                    "Kulüp Kayıt") {
                                  context.pushNamed(
                                    AppRoutes.clubRegister.name,
                                  );
                                } else if (headerContent.cards[0].title ==
                                    "Turnuvalar") {
                                  context.pushNamed(AppRoutes.tournamend.name);
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        headerContent.cards[0].backgroundImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),

                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom:
                                          headerContent.cards[0].title ==
                                              'Turnuvalar'
                                          ? 12
                                          : null,
                                      child: SizedBox(
                                        width:
                                            headerContent.cards[0].title ==
                                                'Turnuvalar'
                                            ? 90
                                            : 50,
                                        height:
                                            headerContent.cards[0].title ==
                                                'Turnuvalar'
                                            ? 90
                                            : 50,
                                        child: headerContent.cards[0].cardImage,
                                      ),
                                    ),

                                    Positioned(
                                      top: 50,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        headerContent.cards[0].title,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  theme.colorScheme.onPrimary,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    Positioned(
                                      top: 70,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        headerContent.cards[0].subtitle,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: Colors.white.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.pushNamed(AppRoutes.news.name);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        headerContent.cards[1].backgroundImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.black.withOpacity(0.7),
                                      ),
                                    ),

                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 30,
                                      child: SizedBox(
                                        width: 50,
                                        height: 70,
                                        child: headerContent.cards[1].cardImage,
                                      ),
                                    ),
                                    Positioned(
                                      top: 48,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        headerContent.cards[1].title,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  theme.colorScheme.onPrimary,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Positioned(
                                      top: 70,
                                      left: 0,
                                      right: 0,
                                      child: Text(
                                        headerContent.cards[1].subtitle,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                              fontSize: 12,
                                              color: Colors.white.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/reservation.svg',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Rezervasyon",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),

                    if (headerContent.showCitySelection)
                      Row(
                        children: [
                          Expanded(
                            child: SelectionCard(
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.black70,
                              ),
                              title: "Ülke",
                              value: "Türkiye",
                              onTap: null,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final selectedCity = ref.watch(
                                  selectedCityProvider,
                                );
                                return SelectionCard(
                                  icon: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.black70,
                                  ),
                                  title: "Şehir",
                                  value: selectedCity ?? "Şehir Seçin",
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
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
                              icon: SvgPicture.asset(
                                'assets/icons/branch.svg',
                                colorFilter: ColorFilter.mode(
                                  AppColors.black70,
                                  BlendMode.srcIn,
                                ),
                              ),
                              title: "Branş",
                              value: selectedBranch?.name ?? "Seçiniz",
                              onTap: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
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

                    SizedBox(height: 10),
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
                            margin: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 5,
                            ),
                            content: Material(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              elevation: 5,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theme.colorScheme.error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: theme.colorScheme.error,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        errorMessage,
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
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
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black60,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
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
                        padding: EdgeInsets.symmetric(vertical: 7),
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
