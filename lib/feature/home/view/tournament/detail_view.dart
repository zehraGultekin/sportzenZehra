import 'package:flutter/material.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/detail_card_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 10,
                children: [
                  DetailCardWidget(
                    theme: theme,
                    icon: Icons.calendar_today,
                    text: 'Başlangıç Tarihi',
                    date: '18.07.2025',
                  ),
                  DetailCardWidget(
                    theme: theme,
                    icon: Icons.calendar_month,
                    text: 'Bitiş Tarihi',
                    date: '18.07.2026',
                  ),
                  DetailCardWidget(
                    theme: theme,
                    icon: Icons.sports,
                    text: 'Turnuva Türü',
                    date: 'Defi Single',
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
