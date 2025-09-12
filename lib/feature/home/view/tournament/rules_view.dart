import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/rules_widget.dart';

class RulesView extends StatefulWidget {
  const RulesView({super.key});

  @override
  State<RulesView> createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Turnuva Kuralları",
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
        showBottomBorder: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        child: Column(
          spacing: 20,
          children: [
            RulesWidget(
              imagePath: "assets/icons/list.svg",
              title: 'Genel Kurallar',
              rules: 'deneme test',
            ),
            RulesWidget(
              imagePath: "assets/icons/ball.svg",
              title: 'Maç Kuralları',
              rules: 'bu bir kuraldır',
            ),
            RulesWidget(
              imagePath: "assets/icons/bar.svg",
              title: 'Puan Sistemi',
              rules: 'ikinci kural',
            ),
          ],
        ),
      ),
    );
  }
}
