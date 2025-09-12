import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/models/planner_mode.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/create_match_modal.dart';

class PyramidView extends StatelessWidget {
  const PyramidView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(
              100,
            ), //Kullanıcının, içeriğin en kenardaki kısımlarını bile rahatça ekranın ortasına getirip inceleyebilmesini sağlamak için. Bu, kullanılabilirlik (usability) açısından çok önemlidir.
            minScale: 0.2,
            maxScale: 3, //Zoom için minimum ve maximum ölçek.
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 40,
                      child: SvgPicture.asset(
                        'assets/icons/award.svg',
                        width: 60,
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: _PlayerCard(
                        rank: 1,
                        name: 'Hamza Fatih Zengin',
                        status: 'available',
                        cardColor: theme.colorScheme.secondary,
                        rankColor: Colors.orange,
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 50,
                      child: _PlayerCard(
                        rankColor: AppColors.black30,
                        rank: 2,
                        name: 'Ahmet Şahin',
                        status: 'available',
                        cardColor: theme.colorScheme.secondary,
                      ),
                    ),
                    Positioned(
                      top: 200,
                      right: 50,
                      child: _PlayerCard(
                        rankColor: Colors.brown[700],
                        rank: 3,
                        name: 'Zehra Gültekin',
                        status: 'isYou',
                        cardColor: AppColors.blue,
                      ),
                    ),
                    Positioned(
                      top: 280,
                      left: 50,
                      child: _PlayerCard(
                        rankColor: AppColors.black60,
                        rank: 4,
                        name: 'Yusuf Boga',
                        status: 'unavailable',
                        cardColor: theme.colorScheme.surface,
                      ),
                    ),
                    Positioned(
                      top: 280,
                      right: 50,
                      child: _PlayerCard(
                        rankColor: AppColors.black60,
                        rank: 5,
                        name: 'Sporzen Test',
                        status: 'unavailable',
                        cardColor: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Siz',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.black70,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 14,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Maç Teklifi Yapılabilir',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.black70,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Şu an Müsait Değil',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.black70,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
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

class _PlayerCard extends StatelessWidget {
  final int rank;
  final String name;
  final String status;
  final Color cardColor;
  final Color? rankColor;

  const _PlayerCard({
    required this.rank,
    required this.name,
    required this.status,
    required this.cardColor,
    required this.rankColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isAvailable = status == 'available';
    final bool isUnavailable = status == 'unavailable';
    final bool isYou = status == 'isYou';

    return GestureDetector(
      onTap: isAvailable
          ? () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: CreateMatchModal(
                      mode: PlannerMode.create,
                      playerName: name,
                    ),
                  );
                },
              );
            }
          : () {
              const String errorMessage = 'Bu oyuncuya maç teklifi yapılmaz';
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                content: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.error,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: theme.colorScheme.error),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            errorMessage,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          child: Text(
                            "Kapat",
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.black60,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                duration: const Duration(seconds: 10),
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },

      child: SizedBox(
        height: 60,
        width: 150,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isYou ? AppColors.blue : cardColor,
                borderRadius: BorderRadius.circular(8),
                border: isUnavailable
                    ? Border.all(color: Colors.grey.shade300)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: isUnavailable ? Colors.grey[600] : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: rankColor ?? Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
