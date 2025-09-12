import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/models/planner_mode.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/match_offer_widget.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/create_match_modal.dart';

class MatchOfferView extends ConsumerWidget {
  const MatchOfferView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final String? seciliFiltre = ref.watch(matchOfferNotifierProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                position: PopupMenuPosition
                    .under, //açtığımız popup ı widgetını altına koy demek için koyduk bunu.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: Icon(Icons.filter_list),
                onSelected: (String secilenDeger) {
                  ref
                      .read(matchOfferNotifierProvider.notifier)
                      .selectChoose(secilenDeger);
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'a',
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: seciliFiltre == 'a'
                              ? theme.colorScheme.secondary
                              : Colors.black,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Tüm Maç Teklifleri',
                          style: TextStyle(
                            fontSize: 14,
                            color: seciliFiltre == 'a'
                                ? theme.colorScheme.secondary
                                : Colors.black,
                          ),
                        ),
                        Spacer(),
                        if (seciliFiltre == 'a')
                          Icon(
                            Icons.check,
                            color: theme.colorScheme.secondary,
                            size: 16,
                          ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'b',
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: seciliFiltre == 'b'
                              ? theme.colorScheme.secondary
                              : Colors.black,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Benim Maç Tekliflerim',
                          style: TextStyle(
                            fontSize: 14,
                            color: seciliFiltre == 'b'
                                ? theme.colorScheme.secondary
                                : Colors.black,
                          ),
                        ),
                        const Spacer(),
                        if (seciliFiltre == 'b')
                          Icon(
                            Icons.check,
                            color: AppColors.secondary,
                            size: 16,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias, //kırpmak için kullandım.
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    right: -30,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.withOpacity(0.08),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.09),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Teklif bekliyor",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Zehra Gültekin",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Ahmet Şahin",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundGrey,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.opacitygrey),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  OfferCard(
                                    icon: Icons.schedule,
                                    iconColor: AppColors.black30,
                                    iconBack: Colors.grey.withOpacity(0.2),
                                    title: "Teklif Tarihi",
                                    date: "11.09.2025",
                                    time: "08.17",
                                    valueColor: AppColors.grey,
                                  ),
                                  const SizedBox(width: 40),
                                  Container(
                                    height: 60,
                                    width: 1,
                                    color: AppColors.black20,
                                  ),
                                  const SizedBox(width: 30),
                                  OfferCard(
                                    icon: Icons.calendar_today,
                                    iconColor: const Color(0xff2196f3),
                                    iconBack: const Color(
                                      0xff2196f3,
                                    ).withOpacity(0.1),
                                    title: "Maç Tarihi",
                                    date: "12.09.2025",
                                    time: "09.00",
                                    valueColor: AppColors.blue,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 100,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF169876),
                                      Color(0xff1fc66a),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/whatsapp.svg',
                                      width: 15,
                                      height: 15,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "+90",
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.80,
                                        decoration: BoxDecoration(
                                          color: theme.scaffoldBackgroundColor,
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                        ),
                                        child: const CreateMatchModal(
                                          mode: PlannerMode.edit,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff21b26b),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Düzenle",
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(
                                            color: theme.colorScheme.onPrimary,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.blue.withOpacity(0.1),
                      child: Text(
                        "vs",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
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
