import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class PyramidView extends StatelessWidget {
  const PyramidView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.2,
            maxScale: 3,
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
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
                      SizedBox(width: 8),
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
    final bool isUnavailable = status == 'unavailable';

    return SizedBox(
      height: 60,
      width: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(8),
              border: isUnavailable
                  ? Border.all(color: Colors.grey.shade300)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: isUnavailable ? Colors.black : Colors.white70,
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
                    color: Colors.black.withOpacity(0.3),
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
    );
  }
}
