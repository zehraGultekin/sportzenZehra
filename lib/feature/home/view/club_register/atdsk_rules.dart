import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class AtdskRules extends StatelessWidget {
  const AtdskRules({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(
        '''
Yılın 365 günü spor yapabilme özelliğine sahip Türkiye'nin güzide kulüplerinden biri olan ATDSK’nin temelleri Atatürk Parkı'nın güney-batısında yer alan, zemini asfalt 2 tenis kortunun son düzenleme sırasında parka dahil edilmesi ile birlikte ortaya çıkan ihtiyaçtan doğdu.

1968 yılında bir araya gelen Paksoy Fabrikası kurucusu işadamı Abdullah Paksoy, İş Bankası Müdürlerinden Haluk Kerkeser, Çukobirlik'ten Behçet Bölgen, çokuluslu bir ilaç firmasının temsilcisi Attila Binöz ve Avukat Turgay Şenyüz, 2 asfalt kortta tenis oynadıkları dönemde düşündükleri kulüp kurma fikrini, bu kortların kaldırılması düşünceleri üzerine hayata geçirmeye karar verdi.

Sadece sportif yönüyle değil, Adana’nın sosyal hayatına da zenginlik katacak bu kulübün kurulması için atağa geçen 5 arkadaş, süratle görüşmeler başlattı. Beden Terbiyesi’nin o dönemdeki Muhasebe Müdürü olan ve kendisi de tenis oynayan merhum Nuri Pamukçu ziyaret edildi. Görüşmenin ardından rota çizildi. Dönemin Adana Valisi merhum Ömer Lütfi Hancıoğlu'nun eşi, kulüp kurucu üyeleri arasında yer alan Fahrünisa hanımdan randevu alındı. Durum aktarıldı. Bu görüşmenin ardından 5 arkadaş, Valilik Konutu’na davet edildi. Bu görüşmede, kulüp için arsa konusu masaya yatırıldı.

Sayın Vali’nin arsa konusu için davet ettiği mülki idare amirleriyle yapılan istişareler sonunda, bugün kullanılan tesis, ATDSK’ya verildi. Adnan Menderes Bulvarı’nın henüz açılmaması nedeniyle Seyhan Baraj Gölü kıyısında yer alan tesislere sahip bir kulübü Adana’ya kazandırmanın heyecanıyla kollar sıvandı. Tenise ek branş olarak yüzme ve su sporları planlandı.

Kurucu üye sayısı yasal sayıya çıkarıldı. Merhum Ali Hamurlu, faaliyetler arasına dağcılığın da alınması önerisiyle, kulübün adı da “Adana Tenis, Dağ ve Su Sporları Kulübü” şeklinde adlandırılmış oldu.

Ulusal ve uluslararası turnuvalara sahip ATDSK, bu girişimlerin ardından 1969 yılında resmen kuruluşunu tamamladı. Altyapıdan yetiştirdiği sporcularla Türkiye’de adından söz ettiren ATDSK,  gerek tesisleri, gerek uluslararası standartlardaki kortları açısından, bir numara iklime sahip olan, Türkiye’nin 1 numaralı kenti Adana’nın, spor faaliyetleri ile Avrupa’ya açılan kapısı oldu.
 
DERNEK KURUCU ÜYELERİ
 
Abdullah PAKSOY, Atilla BİNÖZ, Behçet BÖLGEN, Fahrünisa HANCIOĞLU, Haluk KERKESER, Kazım KESER, Korkut ARIKOĞLU, Mükerrem GÜLER, Nuri PAMUKÇU, Nevzat KARAZİNCİR, Tacettin GÖKDENİZ, Turgay ŞENYÜZ, Süleyman ÇELİK, Yümnü ÇETİNEL.
          ''',
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.black90,
        ),
      ),
    );
  }
}
