import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinanceErrorDialog extends StatelessWidget {
  final ThemeData theme;

  const FinanceErrorDialog({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: theme.colorScheme.surface,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_outlined,
            weight: 2,
            color: theme.colorScheme.error,
            size: 45,
          ),
          const SizedBox(height: 10),
          Text(
            "Hata",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "Kulübünüzün online ödeme modülü devre dışı.Lütfen kulübünüzün yöneticisiyle iletişime geçiniz.",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Color.fromARGB(228, 233, 232, 232),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Tamam",
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
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
