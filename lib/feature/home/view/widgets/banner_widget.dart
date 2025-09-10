import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/mock/banner_mock.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

class HomeBannerWidget extends ConsumerWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(13),
        child: PageView.builder(
          itemCount: bannerItems.length,
          onPageChanged: (value) {
            ref.read(currentPageProvider.notifier).changePage(value);
          },
          itemBuilder: (context, index) {
            final banner = bannerItems[index];
            return Stack(
              children: [
                Image.asset(
                  banner.imagePath,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black45],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  bottom: 11,
                  child: Container(
                    height: 18,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: theme.colorScheme.secondary,
                    ),
                    child: Center(
                      child: Text(
                        banner.title,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
