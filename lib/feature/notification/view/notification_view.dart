import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bildirimler"),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Sistemde kayıtlı bildirm bulunmamaktadır.",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
