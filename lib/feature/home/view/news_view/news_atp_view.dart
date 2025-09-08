import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class NewAtpDetail extends StatelessWidget {
  const NewAtpDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Haberler",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "ATP / WTA TOP 10-28.07.2025",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Serdar Sözkesen", style: theme.textTheme.bodyLarge),
                Text("28 Temmuz 2025 - ATP", style: theme.textTheme.bodySmall),
              ],
            ),
            Image.asset(
              "assets/images/atptour.jpeg",
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Text(
              '''2025 Wimbledon Tenis Şampiyonası'nın ardından, dünya çapında tenisçiler sert kort sezonuna geçiş yaptı. 
Bu geçiş, özellikle Kuzey Amerika'da düzenlenen turnuvalarla hız kazandı ve oyuncuların adaptasyon süreçleri dikkatle izlendi.

Carlos Alcaraz, Cincinnati'deki finalde kaybetmesine rağmen, sert kortlardaki oyununu geliştirmeye devam ediyor. 
Amerika Açık öncesi hazırlıklarını sürdüren Alcaraz, özellikle servis ve forehand performansıyla dikkat çekiyor.

Kadınlar tenisinde, Aryna Sabalenka, Cincinnati'de kazandığı şampiyonlukla sert kort sezonuna güçlü bir başlangıç yaptı.''',
              textAlign: TextAlign.start,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              text: TextSpan(
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: "The post "),
                  TextSpan(
                    text: "ATP / WTA TOP 10 - 28.07.2025",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      decorationColor: AppColors.blue,
                    ),
                  ),
                  TextSpan(text: " first appeared on "),
                  TextSpan(
                    text: "Kort Dergisi",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                    ),
                  ),
                  TextSpan(text: "."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
