import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/login/data/tab_content_model.dart';
import 'package:sportzenzehra/feature/login/view/widgets/tab_content_card.dart';

class KvkkView extends StatefulWidget {
  const KvkkView({super.key});

  @override
  State<KvkkView> createState() => _KvkkViewState();
}

class _KvkkViewState extends State<KvkkView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          toolbarHeight: 100,
          title: "Yasal Politikalar",
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
          bottom: TabBar(
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
        ),
        body: TabBarView(
          children: [
            Column(
              children: kvkkSections
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: TabContent(title: e.title, subtitle: e.subtitle),
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
                      child: TabContent(title: e.title, subtitle: e.subtitle),
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
                      child: TabContent(title: e.title, subtitle: e.subtitle),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
