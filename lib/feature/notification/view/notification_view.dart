import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';
import 'package:sportzenzehra/feature/notification/view/widgets/notification_card.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(title: "Bildirimler"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            NotificationCard(
              theme: theme,
              title: 'Kulüp Üyeliği Onaylandı',
              subtitle:
                  '"Sayın Zehra Gültekin , Applantis Tenis Kulübü kulübüne yapmış olduğunuz üyelik onaylanmıştır",',
              clock: '12:32',
              date: '02.09.2025',
            ),
            NotificationCard(
              theme: theme,
              title: "Applantis Tenis Kulübü",
              subtitle: "Applantis Tenis Kulübü:Test\nDuyuru Deneme",
              clock: "13.44",
              date: "25.02.2025",
            ),
            NotificationCard(
              theme: theme,
              title: "Applantis Tenis Kulübü",
              subtitle: "Applantis Tenis Kulübü:test",
              clock: "16.09",
              date: "30.01.2025",
            ),
            Text(
              "Tüm bildirimler görüntülenmiştir",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
