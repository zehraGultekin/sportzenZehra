import 'package:sportzenzehra/feature/home/data/models/club_model.dart';

List<ClubModel> allClubsData = [
  ClubModel(
    id: 'applantis',
    name: 'Applantis Tenis Dağ ve Su Sporları Kulübü',
    logoAsset: 'assets/images/newlogo.png',
    mainImageAsset: 'assets/images/applantistenis.jpg',
    aboutText:
        "Applantis Tenis Kulübü 2025 yılında Adana'da kurulmuştur. Uygun fiyatlı kortları ve konforlu tesisleriyle tenis severlere hizmet vermektedir.",
    rulesText:
        'Applantis için özel kurallar metni buraya gelecek. Her kulübün kendi kuralları bu alanda gösterilir.',
    phone: '+90 212 963 13 42',
    email: 'info@applantis.net',
    address: 'Applantis, Çukurova, Adana',
  ),
  ClubModel(
    id: 'atdsk',
    name: 'Adana Tenis, Dağ ve Su Sporları Kulübü',
    logoAsset:
        'assets/images/atdsk_logo.png', // Bu dosyayı assets'e eklemelisin
    mainImageAsset:
        'assets/images/atdsk_main.png', // Bu dosyayı assets'e eklemelisin
    aboutText:
        'ATDSK, Adana\'nın en köklü spor kulüplerinden biridir. Ulusal ve uluslararası turnuvalara ev sahipliği yapmaktadır.',
    rulesText:
        '''Yılın 365 günü spor yapabilme özelliğine sahip Türkiye'nin güzide kulüplerinden biri olan ATDSK’nin temelleri Atatürk Parkı'nın güney-batısında yer alan, zemini asfalt 2 tenis kortunun son düzenleme sırasında parka dahil edilmesi ile birlikte ortaya çıkan ihtiyaçtan doğdu...''',
    phone: '+90 322 232 11 22',
    email: 'info@atdsk.org.tr',
    address: 'Güzelyalı Mah. Adnan Menderes Blv. Adana',
  ),
];
