import 'package:flutter/material.dart';
import 'package:sportzenzehra/feature/home/data/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel model;

  const CategoryWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(model.backgroundImage, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(model.cardImage, fit: BoxFit.cover),
                    ),
                  ),

                  Text(
                    model.title,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 15,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    model.subtitle,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
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
