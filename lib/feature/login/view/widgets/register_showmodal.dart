import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/login/data/mock/tab_section_mock.dart';

import 'package:sportzenzehra/feature/login/view/widgets/tab_content_card.dart';

class RegisterShowmodal extends StatefulWidget {
  const RegisterShowmodal({super.key});

  @override
  State<RegisterShowmodal> createState() => _RegisterShowmodalState();
}

class _RegisterShowmodalState extends State<RegisterShowmodal> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.colorScheme.secondary,
            ),
          ),
          SizedBox(height: 20),
          Text("Yasal Politikalar", style: theme.textTheme.titleLarge),
          DefaultTabController(
            length: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  TabBar(
                    dividerColor: AppColors.grey.withValues(alpha: 0.3),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Column(
                            children: TabSectionMock.kvkkSections
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    child: TabContent(
                                      title: e.title,
                                      subtitle: e.subtitle,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Column(
                          children: TabSectionMock.serviceSections
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
                          children: TabSectionMock.securitySections
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
