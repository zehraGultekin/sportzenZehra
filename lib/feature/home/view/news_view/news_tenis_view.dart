import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/widgets/appbar.dart';

class NewsTenisDetail extends StatelessWidget {
  const NewsTenisDetail({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Tenisi çok özledim!",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Serdar Sözkesen", style: theme.textTheme.bodyLarge),
                  Text(
                    "27 Temmuz 2025 - KORT DERGİSİ",
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              Image.asset(
                "assets/images/tenisnews.jpg",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(
                "“Toparlanma sürecindeyim şu an. Gözlerimde biraz sıkıntı var. Ayrıca fitness yaptığımda çok çabuk yoruluyorum. Ana sıkıntım gözlerde ve diplopi (çift görme) adında bir teşhis konuldu bana ve bu hastalığın geçmesi 1.5 seneyi bulabilirmiş.”",
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "FOTOĞRAFLAR VE RÖPORTAJ: SERDAR SÖZKESEN",
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                ''' 30 Kasımm 2024’te Tunus’ta katıldığı turnuvada rahatsızlanıp beyin kanamasıyla hastaneye kaldırılan ve uzun süreçte hâlâ tedavisi devam eden Altuğ Çelikbilek ile son durumu hakkında konuştuk. Bundan sonrasını kendi ağzından dinleyelim…",

 Öncelikle beynimde tümör varmış. Tümör de maç oynarken kanama yapmış. Sebepleri tam olarak belli değil ama doktorlar strese bağlı olduğunu söylüyorlar. Normalde tümör kanama yapmazmış ama ben de tam tersi işledi. Yine de bu durum uzun vadede iyi bir şeymiş çünkü onu keşfedemeseler, fark edemeseler, 40-50’li yaşlarda daha fazla sorun olabilirmiş''',
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                "assets/images/tennis2.jpg",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(
                "Yankı ile Tunus’ta çiftlerde maç yaparken birdenbire baş ağrım başladı. Sonra bu yüzden maçtan çekilmek zorunda kaldım. Otele gitmek için servis bekliyordum. Bu sırada kustum ve otele döndüğümde yine kustum. Ons Jabeur’un fizyoterapisti de oradaydı ve yanıma geldi. Sonrasını ise hiç hatırlamıyorum.",
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '''Devam eden ve yoğun bakıma alındığım süreçte 14 gün boyunca neler yaşadığımı,nerede olduğumu hatırlamıyorum. Bu dönemde Tunus’ta kanamamı durdurmuşlar. Ardından özel uçakla İstanbul’a taşıyıp hem kanamayı temizlemişler hem de tümörü temizlemişler. Şu an tümör yok vücudumda.

EN BÜYÜK SORUN GÖZLERİMDE''',
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Toparlanma sürecindeyim şu an. Gözlerimde biraz sıkıntı var. Ayrıca fitness yaptığımda çok çabuk yoruluyorum. Ana sıkıntım gözlerde ve diplopi (çift görme) adında bir teşhis konuldu bana ve bu hastalığın geçmesi 1.5 seneyi bulabilirmiş. Göz sinirleriyle ilgili bir durum ve görmemde herhangi bir sıkıntı olmasa da gözlerimin hizası eşit olmadığı için maalesef çift görüyorum.",
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                "assets/images/tenis3.jpg",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(
                '''Tüm bunların dışında toparlanma sürecim gayet iyi gidiyor.Haftada 4-5 gün fitness’a giriyorum.Sabah genelde kuvvet antrenmanları,akşamları da 6-7 km yürüyüş yapıyorum.Bu süreçte vücudumu fazla zorladığımiçin yorulmamdan dolayı bazı günler ara veriyor ve fitness da yapamıyorum.

Açıkçası bu aralar zamanımı dolduracağım bir meşguliyet arıyorum. ENKA’ya bu konuda yardımcı oluyorum. Hastalığım sürecinde özel uçak masrafları, hastane masrafları gibi kalemleri, kulübüm olan ENKA Spor Kulübü karşıladı.Onlara buradan çok teşekkür ediyorum. Ben de onlara elimden geldiğince yardım etmeye çalışıyorum.

Ülke tenisi iyi gidiyor sayılır. Daha iyi olabiliriz ama Zeynep Sönmez’in başarıları bizi çok gururlandırıyor. Ben de bu süreci atlatırsam tekrar çok özlediğim tenise geri dönüp, ülkemize faydalı işler sağlamak istiyorum.''',
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "*: Bu röportaj ilk olarak Kort Dergisi’nin 60. sayısında (Temmuz 2025) yayımlanmıştır.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "The post "),
                    TextSpan(
                      text: "Tenisi çok özledim!",
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue,
                        decorationThickness: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(text: " first appeared on "),
                    TextSpan(
                      text: "Kort Dergisi",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 1.5,
                      ),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
