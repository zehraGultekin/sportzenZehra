import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Hakkında",
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.secondary,
            size: 20,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundGrey,
                  border: Border.all(color: AppColors.opacitygrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Uygulama Hakkında",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Spor Tesisi Yönetimi ve Rezervasyon Sistemi",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.black50,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Bu uygulama, spor tesislerinin yönetimini kolaylaştırmak ve sporseverlerin rezervasyon süreçlerini hızlandırmak amacıyla Applantis Yazılım Teknolojileri tarafından geliştirilmiştir. Kullanıcı dostu arayüzü ve gelişmiş özellikleriyle spor aktivitelerinizi planlamanın en kolay yolunu sunuyoruz.",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Öne Çıkan Özellikler:",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "• Hızlı ve kolay rezervasyon işlemleri\n"
                      "• Gerçek zamanlı tesis müsaitlik durumu\n"
                      "• Kişiselleştirilmiş kullanıcı profilleri\n"
                      "• Entegre ödeme sistemi\n"
                      "• Rezervasyon geçmiş ve istatistikler\n"
                      "• Anlık bildirimler ve hatırlatmalar",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundGrey,
                  border: Border.all(color: AppColors.opacitygrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Applantis Yazılım Teknolojileri\nHakkında",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Zamanın Ötesinde, İnovasyonun Peşinde",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.black50,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Applantis Yazılım Teknolojileri, 2018 yılından bu yana teknolojiyi insanların hayatını kolaylaştırmak ve zamanlarını en verimli şekilde kullanmalarını sağlamak için bir araç olarak görüyor. Hayal gücümüzü ve teknik bilgimizi harmanlayarak yenilikçi yazılım çözümleri geliştiriyoruz.",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Misyonumuz:",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "• Kullanıcı odaklı, sezgisel ve etkili yazılımlar geliştirmek\n"
                      "• Dijital dönüşüm sürecinde bireylere ve işletmelere rehberlik etmek\n"
                      "• Teknolojik yenilikleri takip ederek, müşterilerimize en güncel çözümler sunmak\n"
                      "• Sürdürülebilir ve çevre dostu teknolojik çözümler üretmek",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "@ 2024 Applantis Yazılım Teknolojileri. Tüm hakları saklıdır",
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.black60,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
