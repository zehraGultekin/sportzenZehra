import 'package:flutter/material.dart';
import 'package:sportzenzehra/feature/home/data/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel model;

  const CategoryWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(model.backgroundImage, fit: BoxFit.fill),
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
                  SizedBox(height: 50, child: Image.asset(model.cardImage)),
                  SizedBox(height: 4),
                  Text(
                    model.title,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    model.subtitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
