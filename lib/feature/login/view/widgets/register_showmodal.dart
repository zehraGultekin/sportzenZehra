import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/login/data/tab_content_model.dart';
import 'package:sportzenzehra/feature/login/view/widgets/tab_content_card.dart';

class RegisterShowmodal extends StatefulWidget {
  const RegisterShowmodal({super.key});

  @override
  State<RegisterShowmodal> createState() => _RegisterShowmodalState();
}

class _RegisterShowmodalState extends State<RegisterShowmodal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Yasal Politikalar",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          DefaultTabController(
            length: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TabBar(
                    dividerColor: AppColors.grey.withValues(alpha: 0.5),
                    labelColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: "KVKK"),
                      Tab(text: "Hizmet Şartları"),
                      Tab(text: "Gizlilik Politikası"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          children: kvkkSections
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: TabContent(
                                    title: e.title,
                                    subtitle: e.subtitle,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                          children: serviceSections
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: TabContent(
                                    title: e.title,
                                    subtitle: e.subtitle,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                          children: securitySections
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: TabContent(
                                    title: e.title,
                                    subtitle: e.subtitle,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
