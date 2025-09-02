import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/utils/modal_helpers.dart';
import 'package:sportzenzehra/feature/home/data/banner_model.dart';
import 'package:sportzenzehra/feature/home/data/category_model.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/widgets/category_card.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedCity = ref.watch(selectedCityProvider);
    final selectedBranch = ref.watch(selectedBranchProvider);
    final isExpanded = ref.watch(headerExpandedProvider);
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withValues(alpha: 0.1),
                    blurRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              "assets/images/logo.png",
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Sporzen Public",
                              style: theme.textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          ref.read(headerExpandedProvider.notifier).state =
                              !isExpanded;
                        },
                        child: AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: Icon(
                            Icons.expand_circle_down,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: isExpanded ? 1.8 : 0,
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                hintText: "Ara",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: AppColors.grey.withValues(
                                      alpha: 0.2,
                                    ),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          GestureDetector(
                            onTap: () {
                              ref.read(headerExpandedProvider.notifier).state =
                                  false;
                            },
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.grey.withValues(alpha: 0.2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundImage: AssetImage(
                                      "assets/images/logo.png",
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Sporzen Public",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: PageView.builder(
                      itemCount: bannerItems.length,
                      onPageChanged: (value) {
                        ref.read(currentPageProvider.notifier).state = value;
                      },
                      itemBuilder: (context, index) {
                        final banner = bannerItems[index];
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.3),
                                spreadRadius: -2,
                                blurRadius: 9,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Image.asset(
                                  banner.imagePath,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black45,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Container(
                                    height: 17,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    ),
                                    child: Center(
                                      child: Text(
                                        banner.title,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(bannerItems.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: currentPage == index
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.clubRegister.name);
                          },

                          child: CategoryWidget(model: cardItems[0]),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.news.name);
                          },
                          child: CategoryWidget(
                            model: cardItems[1],
                          ), //elle yazmak yerine dinamik yapabiiilirimmm     Row(children : cardItems.map((items)=>Expanded( child: CtegoryWidget(model:item)).toList() şeklindeee yapabilirimmm.))
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 30,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Rezervasyon",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                              showCityModal(context, selectedCityProvider),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SelectionCard(
                    icon: Icons.sports_baseball_outlined,
                    title: "Branş",
                    value: selectedBranch?.name ?? "Şeçiniz",
                    onTap: () =>
                        showBranchModal(context, selectedBranchProvider),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.reservationDetail.name);
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
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Sahaları Ara",
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
