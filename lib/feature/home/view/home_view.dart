import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/router/router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';
import 'package:sportzenzehra/feature/home/data/banner_model.dart';
import 'package:sportzenzehra/feature/home/data/category_model.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';
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
    final selectedCity = ref.watch(selectedCityProvider);
    final selectedBranch = ref.watch(selectedBranchProvider);
    final isExpanded = ref.watch(headerExpandedProvider);
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withValues(alpha: 0.1),
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
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
                            style: Theme.of(context).textTheme.headlineLarge,
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
                            color: Theme.of(context).colorScheme.primary,
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
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.grey.withValues(alpha: 0.2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Row(
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/user.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Text(
                        "Zehra Gültekin",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),

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
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withValues(
                                      alpha: 0.7,
                                    ),
                                    blurRadius: 5,
                                    offset: const Offset(0, 4),
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
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              left: 20,
                              bottom: 10,
                              child: Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                                child: Center(
                                  child: Text(
                                    banner.title,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoutes.clubregister.name);
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
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rezervasyon",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
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
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: AppColors.grey.withValues(
                                            alpha: 0.4,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Şehir Seç",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.1),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color: AppColors.grey,
                                            ),
                                            Text(
                                              "Ara",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurface
                                                        .withValues(alpha: 0.7),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount:
                                              SelectionInputModel.cities.length,
                                          itemBuilder: (context, index) {
                                            final city = SelectionInputModel
                                                .cities[index];
                                            return Container(
                                              height: 45,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Theme.of(
                                                  context,
                                                ).scaffoldBackgroundColor,

                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey.withValues(
                                                    alpha: 0.4,
                                                  ),
                                                  width: 1,
                                                ),
                                              ),
                                              child: ListTile(
                                                title: Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 15,
                                                  ),
                                                  child: Text(
                                                    city,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.bodyMedium,
                                                  ),
                                                ),
                                                onTap: () {
                                                  ref
                                                          .read(
                                                            selectedCityProvider
                                                                .notifier,
                                                          )
                                                          .state =
                                                      city;
                                                  context.pop();
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SelectionCard(
                    icon: Icons.sports_baseball_outlined,
                    title: "Branş",
                    value: selectedBranch?.name ?? "Şeçiniz",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              children: [
                                Container(
                                  height: 4,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.grey.withValues(
                                      alpha: 0.4,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Branş Seç",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineLarge,
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        SelectionInputModel.branches.length,
                                    itemBuilder: (context, index) {
                                      final branch =
                                          SelectionInputModel.branches[index];
                                      return Container(
                                        height: 45,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,

                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: AppColors.grey.withValues(
                                              alpha: 0.4,
                                            ),
                                            width: 1,
                                          ),
                                        ),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          leading: Icon(
                                            branch.icon,
                                            color: Colors.black.withValues(
                                              alpha: 0.8,
                                            ),
                                          ),
                                          title: Text(
                                            branch.name,
                                            style: AppTextStyles.selectionvalue,
                                          ),
                                          onTap: () {
                                            ref
                                                    .read(
                                                      selectedBranchProvider
                                                          .notifier,
                                                    )
                                                    .state =
                                                branch;
                                            context.pop();
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.reservationdetail.name);
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
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
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
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
