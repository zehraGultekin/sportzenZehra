import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/banner_model.dart';
import 'package:sportzenzehra/feature/home/data/category_model.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/widgets/category_card.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';
import 'package:sportzenzehra/feature/home/view/widgets/show_modal_branch.dart';
import 'package:sportzenzehra/feature/home/view/widgets/show_modal_city.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final isExpanded = ref.watch(headerExpandedProvider);
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
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
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(headerExpandedProvider.notifier)
                                  .expanded();
                            },
                            child: AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0.0,
                              duration: Duration(milliseconds: 300),
                              child: Icon(
                                Icons.expand_circle_down,
                                size: 25,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: isExpanded ? 1.1 : 0,
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(height: 12),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.backgroundGrey,
                                    hintText: "Ara",
                                    hintStyle: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: AppColors.grey,
                                          fontSize: 17,
                                        ),
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
                                        color: AppColors.grey.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(headerExpandedProvider.notifier)
                                      .expanded();
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundGrey,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.grey.withValues(
                                        alpha: 0.2,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                          "assets/images/logo.png",
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Sporzen Public",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color:
                                                  theme.colorScheme.onSurface,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(headerExpandedProvider.notifier)
                                      .expanded();
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundGrey,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.grey.withValues(
                                        alpha: 0.2,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                          "assets/images/newlogo.png",
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Applantis Tenis Kulübü",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color:
                                                  theme.colorScheme.onSurface,
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
                    ],
                  ),
                );
              },
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: PageView.builder(
                          itemCount: bannerItems.length,
                          onPageChanged: (value) {
                            ref
                                .read(currentPageProvider.notifier)
                                .changePage(value);
                          },
                          itemBuilder: (context, index) {
                            final banner = bannerItems[index];
                            return Container(
                              decoration: BoxDecoration(boxShadow: [
                                 
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
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
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
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, child) {
                      final currentPage = ref.watch(currentPageProvider);

                      return Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(bannerItems.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: currentPage == index
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      );
                    },
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
                        style: theme.textTheme.titleMedium?.copyWith(
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
                        child: Consumer(
                          builder: (context, ref, child) {
                            final selectedCity = ref.watch(
                              selectedCityProvider,
                            );

                            return SelectionCard(
                              icon: Icons.location_on_outlined,
                              title: "Şehir",
                              value: selectedCity,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ShowModalCity(selectedCityProvider);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, ref, child) {
                      final selectedBranch = ref.watch(selectedBranchProvider);

                      return SelectionCard(
                        icon: Icons.sports_baseball_outlined,
                        title: "Branş",
                        value: selectedBranch?.name ?? "Seçiniz",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ShowModalBranch(selectedBranchProvider);
                            },
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Consumer(
                    builder: (context, ref, child) {
                      final selectedBranch = ref.watch(selectedBranchProvider);
                      final selectedCity = ref.watch(selectedCityProvider);

                      return GestureDetector(
                        onTap: () {
                          if (selectedCity.isEmpty || selectedBranch == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Arama yapmak için şehir ve branş seçmelisiniz.",
                                ),
                              ),
                            );
                            return;
                          }

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
                              SizedBox(width: 10),
                              Text(
                                "Sahaları Ara",
                                style: theme.textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
