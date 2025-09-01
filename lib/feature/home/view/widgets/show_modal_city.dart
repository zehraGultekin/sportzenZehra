import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/feature/home/data/selection_input.dart';

class ShowModalCity extends ConsumerWidget {
  final StateProvider<String?> cityProvider;

  const ShowModalCity(this.cityProvider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Container(
            height: 4,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grey.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: 20),
          Text("Şehir Seç", style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 20),
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.grey),
                Text(
                  "Ara",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: SelectionInputModel.cities.length,
              itemBuilder: (context, index) {
                final city = SelectionInputModel.cities[index];
                return Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        city,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    onTap: () {
                      ref.read(cityProvider.notifier).state = city;
                      context.pop();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
