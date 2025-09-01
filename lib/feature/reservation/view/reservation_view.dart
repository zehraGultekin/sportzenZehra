import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class ReservationView extends StatefulWidget {
  const ReservationView({super.key});

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(title: "Rezervasyonlarım"),
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: AppColors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: "Aktif Rezervasyon"),
                Tab(text: "Pasif Rezervasyon"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      "Sisteme kayıtlı aktif rezervasyon buulunmamaktadır.",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Sisteme kayıtlı pasif rezervasyon bulunmamaktadır.",
                      style: Theme.of(context).textTheme.labelLarge,
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
