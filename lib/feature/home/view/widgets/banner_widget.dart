import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportzenzehra/feature/home/data/mock/banner_mock.dart';
import 'package:sportzenzehra/feature/home/provider/home_providers.dart';

class HomeBannerWidget extends ConsumerWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: PageView.builder(
        itemCount: bannerItems.length,
        onPageChanged: (value) {
          ref.read(currentPageProvider.notifier).changePage(value);
        },
        itemBuilder: (context, index) {
          final banner = bannerItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withValues(alpha: 0.06),
                  offset: const Offset(2, -2),
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withValues(alpha: 0.06),
                  offset: const Offset(-2, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    banner.imagePath,
                    width: double.infinity,
                    height: 200,
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
                      height: 17,
                      width: 55,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
