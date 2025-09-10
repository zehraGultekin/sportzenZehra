import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class DetailCardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String date;
  const DetailCardWidget({
    super.key,
    required this.theme,
    required this.icon,
    required this.text,
    required this.date,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xff2196f3).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon, color: Color(0xff2196f3), size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.black60,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

/*flutter svg formatını desteklemiyor biz de bu yüzden bunu paketle kullanılabilir kılıyoruz

- Sonsuz ölceklenebilir ne kadar büyütürsek büyütelim kalite kaybı olmaz
- şekillderin ve renklerin matematiksel tanımını içerir.
- Kod üzerinden rengi , boyutunu ve hatta bazı kısımları dinamik olarak değiştirebiliyoruz.
- SVG dosyası her ekranda mükemmel gözükür.



*/
