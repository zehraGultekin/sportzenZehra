import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/models/reservation2_model.dart';

class ReservationCard extends ConsumerWidget {
  final String kortName;
  final String type;
  final String surface;
  final String imageAsset;
  final Color backgroundColor;
  final List<ReservationModel> reservations;
  final bool isExpanded;

  const ReservationCard({
    super.key,
    required this.kortName,
    required this.type,
    required this.surface,
    required this.imageAsset,
    required this.backgroundColor,
    required this.reservations,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        kortName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        surface,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(imageAsset, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: isExpanded ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  shrinkWrap:
                      true, //Sonsuz uzunlukta olma, sadece içindeki elemanların kapladığı yükseklik kadar yer kapla.
                  physics:
                      const BouncingScrollPhysics(), //iosdaki kaydırma davtanışı
                  itemCount: reservations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //ekrana sabit sayıda sütun veya satır sığdırmak için kullanıyoruz
                    crossAxisCount:
                        3, //Sütun sayısını belirlemek için kullandık
                    crossAxisSpacing: 10, //Sütünlar arası yatay boşluk.
                    mainAxisSpacing: 10, //Satırlar arası dikey boşluk
                    childAspectRatio: 1.2, // en boy oranı
                  ),
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.gradviewColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              reservation.icon,
                              Text(
                                reservation.degree,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            reservation.clock,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            reservation.state,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
