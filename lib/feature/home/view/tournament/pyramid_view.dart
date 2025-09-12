import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/view/enums/player_status.dart';
import 'package:sportzenzehra/feature/home/view/tournament/widgets/player_card.dart';

class PyramidView extends StatelessWidget {
  const PyramidView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            scaleEnabled: true,
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
                      child: PlayerCard(
                        rank: 1,
                        name: 'Hamza Fatih Zengin',
                        rankColor: Colors.orange,
                        status: PlayerStatus.avaible,
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 50,
                      child: PlayerCard(
                        rankColor: AppColors.black30,
                        rank: 2,
                        name: 'Ahmet Şahin',
                        status: PlayerStatus.busy,
                      ),
                    ),
                    Positioned(
                      top: 200,
                      right: 50,
                      child: PlayerCard(
                        rankColor: Colors.brown[700],
                        rank: 3,
                        name: 'Zehra Gültekin',
                        status: PlayerStatus.isYou,
                      ),
                    ),
                    Positioned(
                      top: 280,
                      left: 50,
                      child: PlayerCard(
                        rankColor: AppColors.black60,
                        rank: 4,
                        name: 'Yusuf Boga',
                        status: PlayerStatus.unavailable,
                      ),
                    ),
                    Positioned(
                      top: 280,
                      right: 50,
                      child: PlayerCard(
                        rankColor: AppColors.black60,
                        rank: 5,
                        name: 'Sporzen Test',
                        status: PlayerStatus.unavailable,
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
                    color: Colors.black.withValues(alpha: 0.08),
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
