import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';
import 'package:sportzenzehra/feature/home/provider/club_register_provider.dart';
import 'package:sportzenzehra/feature/home/view/widgets/selection_card.dart';

class ClubRegisterView extends ConsumerStatefulWidget {
  const ClubRegisterView({super.key});

  @override
  ConsumerState<ClubRegisterView> createState() => _ClubRegisterViewState();
}

class _ClubRegisterViewState extends ConsumerState<ClubRegisterView> {
  @override
  Widget build(BuildContext context) {
    final selectedCity = ref.watch(selectedCityProvider);
    final selectedBranch = ref.watch(selectedBranchProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kulüp Seç",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            padding: const EdgeInsets.all(16),
                            height: MediaQuery.of(context).size.height * 0.6,
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
                                  "Şehir Seç",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(12),

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
                                      Icon(Icons.search, color: Colors.grey),
                                      Text(
                                        "Ara",
                                        style: AppTextStyles.selectionvalue
                                            .copyWith(color: Colors.grey),
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
                                      final city =
                                          SelectionInputModel.cities[index];
                                      return Container(
                                        height: 45,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 7,
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
                              color: AppColors.grey.withValues(alpha: 0.4),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Branş Seç",
                            style: AppTextStyles.headline1.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: SelectionInputModel.branches.length,
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

                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.grey.withValues(
                                        alpha: 0.4,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: ListTile(
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
                                                selectedBranchProvider.notifier,
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
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).scaffoldBackgroundColor,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      radius: 20,
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kulübünüz listede yok mu?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          "Eğer bi Kulüp işletmecisi iseniz kulübünüzü\nkaydetmek için dokunun.",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Kulüpler",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Aramaya başlamak için şehir veya branş seçmeni gerekmektedir",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
